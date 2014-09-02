class mcollective::configure inherits mcollective {
	
	file { 'mcollective_configure':
		ensure  => file,
		path    => "/etc/mcollective/server.cfg",
		content => template("mcollective/server.erb"),
		notify  => Service["mcollective_service"]
	}

}
