class teamboard_client::nginx {

	package { "teamboard_client_nginx":
		name => "nginx",
		ensure => present
	}

	file { "nginx_config":
		path => "/etc/nginx/sites-enabled/default",
		source => "puppet:///modules/teamboard_client/nginx_config",
		ensure => present,
		require => Package["teamboard_client_nginx"],
		notify => Service["nginx_service"]
	}

	service { "nginx_service":
		name => "nginx",
		ensure => running
	}
}
