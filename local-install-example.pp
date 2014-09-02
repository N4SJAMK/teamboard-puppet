
class { "teamboard_api":
	revision     => "master",
	node_env     => "production",
	mongodb_url  => "mongodb://localhost/production",
	mongodb_port => 27017,
	redis_host   => "127.0.0.1",
	redis_port   => 6379,
	token_secret => "roope",
	port         => 9002,
	static_url   => "http://localhost",
	static_port  => 9003,
}

class { "teamboard_io":
	revision   => "master",
	node_env   => "production",
	api_url    => "http://localhost",
	api_port   => 9002,
	redis_host => "127.0.0.1",
	redis_port => 6379,
	port       => 9001,
}

class {"teamboard_img":
	port        => 9003,
	mongodb_url => "mongodb://localhost/production",
}

class {"teamboard_crypt":
	revision => "master",
}

class { "teamboard_client":
	revision => "master",
	api_url  => "http://203.0.113.99",
	api_port => 9002,
	io_url   => "http://203.0.113.99",
	io_port  => 9001,
}

# Mongo and Redis modules 
# work only on ubuntu not on RH or CentOS
class { "teamboard_mongodb":
	port => 27017
}

class { "teamboard_redis":

}
