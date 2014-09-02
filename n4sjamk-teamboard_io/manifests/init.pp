class teamboard_io(
	$node_env			= "production",
	$port				= "9001",
	$redis_host			= "localhost",
	$redis_port			= "6379",
	$api_host			= "http://localhost",
	$api_url			= "http://localhost",
	$api_port			= "9002",
	$revision			= "master",
	$source				= "https://github.com/N4SJAMK/teamboard-io.git",
) {

	include teamboard_common
	anchor {"teamboard_io::begin":} ->
	class {"::teamboard_io::install":} ->
	class {"::teamboard_io::service":} ->
	anchor {"teamboard_io::end":}

}
