class teamboard_api::service inherits teamboard_api {

	file { 'teamboard_api_init':
		path => "/etc/init.d/teamboard-api",
		source => "puppet:///modules/teamboard_api/$initfile",
	}

	service { 'teamboard_api_service':
		name => "teamboard-api",
		ensure => running,
		enable => true,
		require => File["teamboard_api_init"],
		subscribe => Exec["teamboard_api_npm_install"]
	}

}
