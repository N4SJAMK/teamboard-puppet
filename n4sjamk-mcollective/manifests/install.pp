class mcollective::install inherits mcollective {

	package {'mcollective_package' :
		name   => "mcollective",
		ensure => installed,
	}

}
