# Disclaimer not tested manifest; may not work

node 'crypt' {
	class { "teamboard_crypt":
		port     => 9004,
		revision => "master",	
	}
}

node 'api' {
	class { "teamboard_api":
		revision     => "master",
		node_env     => "production",
		mongodb_url  => "mongodb://mongo/development",
		mongodb_port => 27017,
		redis_host   => "redis",
		redis_port   => 6379,
		token_secret => "roope",
		port         => 9002,
		static_url   => "http://client",
		static_port  => 9003,
		crypto_url   => "http://crypt",
		crypto_port  => 9004
	}
}

node 'io' {
	class { "teamboard_io":
		revision   => "master",
		node_env   => "production",
		api_port   => 80,
		api_url    => "http://api",
		redis_host => "redis",
		redis_port => 6379,
		port       => 9001
	}
}

node 'client' {
	class { "teamboard_redis":

	}

	class { "teamboard_img":
		revision    => "master",
		port        => 9003,
		mongodb_url => "mongodb://mongo/production"
	}

	class { "teamboard_client":
		revision => "master",
		api_url  => "http://api-url", # public api url or ip
		api_port => 80,
		io_url   => "http://io-url", # public io url or ip
		io_port  => 80,
	}
}

node 'mongo' {
	class { "teamboard_mongo":

	}
}
