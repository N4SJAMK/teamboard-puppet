class teamboard_img::install inherits teamboard_img {

	file { 'teamboard_img_dir':
		path => "/home/teamboard/img",
		ensure => directory,
		owner => "teamboard"
	}

	file { 'teamboard_img_config':
		path => "/etc/default/teamboard-img",
		ensure => file,
		content => template('teamboard_img/teamboard-img.erb')
	}

	vcsrepo { '/home/teamboard/img/teamboard-img':
		ensure   => latest,
		provider => git,
		source   => $source,
		revision => $revision,
		notify   => Exec["teamboard_img_npm_install"],
		user     => "teamboard",
	}
	
	exec { 'teamboard_img_npm_install':
		command => "bash -c 'cd /home/teamboard/img/teamboard-img && npm install'",
		path => ["/bin", "/usr/bin", "/usr/local/bin"],
		user => "teamboard",
		environment => ["HOME=/home/teamboard"],
		require => File["teamboard_img_config"],
		refreshonly => true
	}
}
