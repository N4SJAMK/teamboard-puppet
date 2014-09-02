class teamboard_client::deps {

	case $::operatingsystem {

		'RedHat', 'CentOs' : {
			$sass_exe = "/usr/bin/sass"
		}

		'ubuntu', 'debian': {
			$sass_exe = "/usr/local/bin/sass"
		}

		default: {
			$sass_exe = "/usr/local/bin/sass"
		}

	}

	exec { 'install_bower':
		command => "npm -g install bower",
		path => ["/usr/bin", "/usr/local/bin"],
		creates => "/usr/local/bin/bower"
	}

	exec { 'install_sass':
		command => "gem install sass",
		path => ["/usr/bin"],
		creates => $sass_exe
	}
}
