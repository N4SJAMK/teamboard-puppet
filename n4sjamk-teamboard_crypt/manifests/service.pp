class teamboard_crypt::service inherits teamboard_crypt {
	case $::operatingsystem {

		'RedHat', 'CentOs' : {

			$initd_file = "puppet:///modules/teamboard_crypt/teamboard-crypt-centos"

		}

		'ubuntu', 'debian': {

			$initd_file = "puppet:///modules/teamboard_crypt/teamboard-crypt"

		}

		default: {

		}

    }

	file { 'teamboard_crypt_init':
		path => "/etc/init.d/teamboard-crypt",
		source => $initd_file,
	}

	service { 'teamboard_crypt_service':
		name => "teamboard-crypt",
		ensure => running,
		enable => true,
		require => File["teamboard_crypt_init"],
		subscribe => Exec["teamboard_crypt_go_get"]
	}

}
