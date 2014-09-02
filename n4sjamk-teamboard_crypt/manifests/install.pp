class teamboard_crypt::install inherits teamboard_crypt {

	file { 'teamboard_crypt_dir':
		path => "/home/teamboard/crypt",
		ensure => directory,
		owner => "teamboard",
	}

	file { 'teamboard_src_dir':
		path => "/home/teamboard/crypt/src",
		ensure => directory,
		owner => "teamboard",
	}

	file { 'teamboard_crypt_config':
		path => "/etc/default/teamboard-crypt",
		ensure => file,
		content => template('teamboard_crypt/teamboard-crypt.erb'),
		notify => Exec["teamboard_crypt_go_get"],
	}

	vcsrepo { '/home/teamboard/crypt/src/teamboard-crypt':
		ensure   => latest,
		provider => git,
		source   => $source,
		revision => $revision,
		notify   => Exec["teamboard_crypt_go_get"],
		user     => "teamboard",
	}

	exec { 'teamboard_crypt_go_get':
		command => "bash -c 'cd /home/teamboard/crypt/src/teamboard-crypt && GOPATH=/home/teamboard/crypt go get'",
		path => ["/bin:/usr/bin"],
		user => "teamboard",
		cwd => "/home/teamboard/crypt",
		refreshonly => true,
	}
}
