class teamboard_common::packages {


	$dependencies = [ "libfontconfig1", "git", "nodejs", "nodejs-legacy", "npm" ]
	package { $dependencies: ensure => "installed" }

	file { "/usr/bin/node":
		ensure => link,
		target => "/usr/bin/nodejs"
	}

}
