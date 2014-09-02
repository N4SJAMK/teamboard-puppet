class teamboard_mongodb(
	$port     = 27017,
	$bind_ip  = "127.0.0.1"
) {

	case $::operatingsystem {

		'RedHat', 'CentOs' : {

			include teamboard_mongodb_configure

		}

		'ubuntu', 'debian': {

			anchor{"teamboard_mongodb::begin":} ->
			class {"teamboard_mongodb::install": } ->
			class {"teamboard_mongodb::configure": } ->
			anchor {"teamboard_mongodb::end":}
		}

		default: {

		}

	}

}
