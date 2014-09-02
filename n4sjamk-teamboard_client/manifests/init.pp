class teamboard_client(
	$node_env      = production,
	$source        = "https://github.com/N4SJAMK/teamboard-client.git",
	$revision      = master,
	$api_url       = "http://localhost",
	$api_port      = 9002,
	$io_url        = "http://localhost",
	$io_port       = 9001,
	$static_url    = "http://localhost",
	$static_host   = $static_url,
	$static_port   = 9003
) {

    include teamboard_common

	case $::operatingsystem {

		'RedHat', 'CentOs' : {

			anchor {"teamboard_client::begin":} ->	
			class {"::teamboard_client::deps":} ->
			class {"::teamboard_client::install":} ->
			anchor {"teamboard_client::end":}

		}

		'ubuntu', 'debian': {

			anchor {"teamboard_client::begin":} ->	
			class {"::teamboard_client::deps":} ->
			class {"::teamboard_client::nginx":} ->
			class {"::teamboard_client::install":} ->
			anchor {"teamboard_client::end":}

		}

		default: {

		}

	}

}

