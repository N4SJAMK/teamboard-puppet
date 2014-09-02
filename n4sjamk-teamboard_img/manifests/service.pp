class teamboard_img::service {

	case $::operatingsystem {

		'RedHat', 'CentOs': {
			$init_script = 'puppet:///modules/teamboard_img/teamboard-img-centos'
		}

		'ubuntu', 'debian': {
			$init_script = 'puppet:///modules/teamboard_img/teamboard-img'
		}

	}

	file { 'teamboard_img_init':
		path   => "/etc/init.d/teamboard-img",
		source => $init_script,
	}

	service { 'teamboard_img_service':
		name => "teamboard-img",
		ensure => running,
		enable => true,
		require => File["teamboard_img_init"],
		subscribe => Exec["teamboard_img_npm_install"]
	}

}
