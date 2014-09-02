class teamboard_crypt(
	$port      = 9004,
	$source    = "https://github.com/N4SJAMK/teamboard-crypt.git",
	$revision  = "master"
) {

    include teamboard_common

	case $::operatingsystem {

		'RedHat', 'CentOs' : {

			anchor {"teamboard_crypt::begin":} ->
			class {"::teamboard_crypt::install":} ->
			class {"::teamboard_crypt::service":} ->
			anchor {"teamboard_crypt::end":}

		}

		'ubuntu', 'debian': {

			anchor {"teamboard_crypt::begin":} ->
			class {"::teamboard_crypt::packages":} ->
			class {"::teamboard_crypt::install":} ->
			class {"::teamboard_crypt::service":} ->
			anchor {"teamboard_crypt::end":}

		}

		default: {

		}

    }

}

