class teamboard_mongodb::configure inherits teamboard_mongodb {

	file_line { 'mongo_smallfiles':
		notify => Service["mongodb"],
		path => '/etc/mongodb.conf',
		line => 'smallfiles = true',
		require => Package["package_mongodb"]
	}

	file_line { 'mongo_port':
		notify => Service["mongodb"],
		path => '/etc/mongodb.conf',
		line => "port=$port",
		match => '^port=.*',
		require => Package["package_mongodb"]
	}

	file_line { 'mongo_bind_ip':
		notify => Service["mongodb"],
		path => '/etc/mongodb.conf',
		line => "bind_ip = $bind_ip",
		match => '^bind_ip\s?=\s?.*',
		require => Package["package_mongodb"]
	}

	service { 'mongodb':
		name => "mongodb",
		ensure => running,
	}

}
