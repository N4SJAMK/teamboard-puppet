class teamboard_client::install inherits teamboard_client {

	file { 'teamboard_client_dir':
		path => "/home/teamboard/client",
		ensure => directory,
		owner => "teamboard"
	}

	file { 'teamboard_config':
		path    => "/etc/default/teamboard-client",
		ensure  => file,
		content => template('teamboard_client/teamboard-client.erb'),
		notify  => Exec["teamboard_client_npm_install"],
	}

	vcsrepo { '/home/teamboard/client/teamboard':
		ensure   => latest,
		provider => git,
		source   => $source,
		revision => $revision,
		notify   => Exec["teamboard_client_npm_install"],
		user     => "teamboard",
	}
	
	exec { 'teamboard_client_npm_install':
		command     => "bash -c 'cd /home/teamboard/client/teamboard && npm install'",
		path        => ["/bin", "/usr/bin"],
		user        => "teamboard",
		require     => File['teamboard_client_dir'],
		refreshonly => true,
		notify      => Exec['teamboard_client_bower_install'],
	}

	exec { 'teamboard_client_bower_install':
		command     => "bower install",
		cwd         => "/home/teamboard/client/teamboard",
		path        => ["/bin", "/usr/bin", "/usr/local/bin"],
		user        => "teamboard",
		require     => Exec['teamboard_client_npm_install'],
		notify      => Exec['teamboard_client_gulp_build'],
		refreshonly => true
	}

	exec { 'teamboard_client_gulp_build':
		command     => "bash -c 'cd /home/teamboard/client/teamboard && NODE_ENV=$node_env API_URL=$api_url API_HOST=$api_url API_PORT=$api_port IO_URL=$io_url IO_HOST=$io_url IO_PORT=$io_port STATIC_URL=$static_url STATIC_HOST=$static_url STATIC_PORT=$static_port /home/teamboard/client/teamboard/node_modules/.bin/gulp build'",
		path        => ["/bin", "/usr/bin", "/usr/local/bin"],
		user        => "teamboard",
		require     => Exec['teamboard_client_bower_install'],
		refreshonly => true
	}
}
