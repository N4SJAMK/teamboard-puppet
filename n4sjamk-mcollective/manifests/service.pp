class mcollective::service inherits mcollective {

	service { 'mcollective_service':
		name      => "mcollective",
		ensure    => running,
		enable    => true,
	}

}
