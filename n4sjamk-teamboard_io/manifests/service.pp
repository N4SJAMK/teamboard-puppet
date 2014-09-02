class teamboard_io::service inherits teamboard_io {

	case $::operatingsystem {

		'RedHat', 'CentOs': {
			$init_script = 'puppet:///modules/teamboard_io/teamboard-io-centos'
		}

		'ubuntu', 'debian': {
			$init_script = 'puppet:///modules/teamboard_io/teamboard-io'
		}

	}

	file { 'tb_io_init':
		path   => "/etc/init.d/teamboard-io",
		source => $init_script,
	}

	file { 'tb_io_default':
		ensure  => file,
		path    => "/etc/default/teamboard-io",
		content => template("teamboard_io/teamboard-io.erb"),
		notify  => Service["tb_io_service"]
	}

	service { 'tb_io_service':
		name    => "teamboard-io",
		ensure  => running,
		enable  => true,
		require => File["tb_io_init"],
		subscribe => Exec["npm_install"]
	}

}
