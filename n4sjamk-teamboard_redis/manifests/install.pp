class teamboard_redis::install inherits teamboard_redis {

	package { 'tb_redis_package':
		name   => "redis-server",
		ensure => present,
	}

}
