class teamboard_haproxy::install inherits teamboard_haproxy {

	include apt

	apt::ppa { 'ppa:vbernat/haproxy-1.5': }

	package { 'tb_haproxy_package':
		name   => "haproxy",
		ensure => present,
	}

}
