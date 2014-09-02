class teamboard_common::ulimits {

	file_line { 'user_soft_limit':
		path => '/etc/security/limits.conf',
		line => '@teamboard soft nofile 65535',
	}

	file_line { 'user_hard_limit':
		path => '/etc/security/limits.conf',
		line => '@teamboard hard nofile 65535',
	}

	file_line { 'common_session_limits':
		path => '/etc/pam.d/common-session',
		line => 'session required pam_limits.so',
	}
}
