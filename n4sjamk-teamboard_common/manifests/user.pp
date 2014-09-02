class teamboard_common::user {
	
	user { 'common_teamboard_user':
		name => "teamboard",
		ensure => "present",
		home => "/home/teamboard",
		managehome => true
	}
}
