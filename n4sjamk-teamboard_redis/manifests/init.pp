class teamboard_redis(
	$bind_address = ""
){

	anchor {"teamboard_redis::begin":} ->
	class {"::teamboard_redis::install":} ->
	class {"::teamboard_redis::configure":} ->
	anchor {"teamboard_redis::end":}

}
