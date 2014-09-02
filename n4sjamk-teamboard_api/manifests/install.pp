class teamboard_api::install inherits teamboard_api {

	file { 'teamboard_api_dir':
		path => "/home/teamboard/api",
		ensure => directory,
		owner => "teamboard"
	}

	file { 'teamboard_api_config':
		path => "/etc/default/teamboard-api",
		ensure => file,
		content => template('teamboard_api/teamboard-api.erb'),
		notify => Service["teamboard_api_service"],
	}

	vcsrepo { '/home/teamboard/api/teamboard-api':
		ensure   => latest,
		provider => git,
		source   => $source,
		revision => $revision,
		notify   => Exec["teamboard_api_npm_install"],
		user     => "teamboard",
	}

	exec { 'teamboard_api_npm_install':
		command => "bash -c 'cd /home/teamboard/api/teamboard-api && npm install'",
		path => ["/bin", "/usr/bin"],
		user => "teamboard",
		environment => ["HOME=/home/teamboard"],
		require => File["teamboard_api_config"],
		refreshonly => true,
	}


	file { 'teamboard_api_run_script':
		path => "/home/teamboard/api/teamboard-api/run.sh",
		ensure => file,
		owner => "teamboard",
		mode => 755,
		content => template('teamboard_api/run.erb'),
	}

}
