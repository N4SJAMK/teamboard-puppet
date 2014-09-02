class teamboard_api(
	$node_env       = production,
	$mongodb_url    = "mongodb://localhost/teamboard",
	$mongodb_port   = 27017,
	$redis_host     = localhost,
	$redis_port     = 6379,
	$token_secret   = "secret",
	$port           = 9002,
	$static_url     = "http://localhost",
	$static_port    = 9003,
	$source	        = "https://github.com/N4SJAMK/teamboard-api.git",
	$revision       = "master",
	$crypto_url     = "http://localhost",
	$crypto_port    = 9004
) {

	include teamboard_common

	case $::operatingsystem {

		'RedHat', 'CentOs' : {

			$initfile="teamboard-api-centos"

		}

		'ubuntu', 'debian': {

			$initfile="teamboard-api"

		}

		default: {

		}

	}

	anchor {"teamboard_api::begin":} ->
	class {"::teamboard_api::install":} ->
	class {"::teamboard_api::service":} ->
	anchor {"teamboard_api::end":}

}
