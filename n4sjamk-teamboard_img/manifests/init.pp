class teamboard_img(
	$revision           = "master",
	$source	            = "https://github.com/N4SJAMK/teamboard-img.git",
	$mongodb_url        = "mongodb://localhost/teamboard",
	$port               = 9003,
	$cleanup_interval   = 60,
	$cleanup_treshold   = 3600
) {

	include teamboard_common

	anchor {"teamboard_img::begin":} ->
	class {"::teamboard_img::install":} ->
	class {"::teamboard_img::service":} ->
	anchor {"teamboard_img::end":}

}
