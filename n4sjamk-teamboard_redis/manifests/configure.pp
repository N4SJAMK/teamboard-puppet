class teamboard_redis::configure inherits teamboard_redis {

	if $bind_address == "" {

	file_line { 'redis_bind_address':
                notify => Service["tb_redis_service"],
                path => '/etc/redis/redis.conf',
                line => "#bind ",
                match => '^#?bind.*',
        } 

	}	
	
	else {

        file_line { 'redis_bind_address':
                notify => Service["tb_redis_service"],
                path => '/etc/redis/redis.conf',
                line => "bind $bind_address",
                match => '^#?bind.*',
        }

	}	

	service { 'tb_redis_service':
		name    => "redis-server",
		ensure  => running,
		enable  => true,
	}

}
