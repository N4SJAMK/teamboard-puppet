class teamboard_crypt::packages {

	case $::operatingsystem {

		'RedHat', 'CentOs' : {

		}

		'ubuntu', 'debian': {

			$dependencies = [ "golang-go", "mercurial" ]
			package { $dependencies: ensure => "installed" }

		}

		default: {

		}

    }

}
