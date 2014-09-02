class teamboard_mongodb::install {

	package { "package_mongodb":
		name => "mongodb-server",
		ensure => present
	}
}
