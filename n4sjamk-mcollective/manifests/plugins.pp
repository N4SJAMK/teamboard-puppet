class mcollective::plugins inherits mcollective {

	$dependencies = [ "mcollective-puppet-agent" ]
	package { $dependencies: ensure => "installed" }

}
