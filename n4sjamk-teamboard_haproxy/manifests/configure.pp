class teamboard_haproxy::configure inherits teamboard_haproxy {

	file { 'tb_haproxy_configure':
		ensure  => file,
		path    => "/etc/haproxy/haproxy.cfg",
		content => template("teamboard_haproxy/haproxy.erb"),
		notify  => Service["tb_haproxy_service"]
	}

	service { 'tb_haproxy_service':
		name    => "haproxy",
		ensure  => running,
		enable  => true,
	}

}
