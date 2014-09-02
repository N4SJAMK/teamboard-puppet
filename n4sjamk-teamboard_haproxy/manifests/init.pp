class teamboard_haproxy(
	$teamboard_api,
	$teamboard_api_lan,
	$teamboard_io,
	$teamboard_io_lan,
	$stats_user,
	$stats_password,
	$api_hosts,
	$ws_hosts,
	$crypt_hosts,
	$teamboard_crypt,
	$teamboard_crypt_lan,
) {

	anchor {"teamboard_haproxy::begin":} ->
	class {"::teamboard_haproxy::install":} ->
	class {"::teamboard_haproxy::configure":} ->
	anchor {"teamboard_haproxy::end":}

}
