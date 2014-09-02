# == Class: mcollective
#
# Installs mcollective to node for easier node management.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
#  class { mcollective:
#  }
#
# === Authors
#
# Hessu Hopo <hessu@hopo.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class mcollective(
	$activemq_url,
	$activemq_port       = "61614",
	$activemq_user       = "mcollective",
	$activemq_password   = "secret",
	$ssl_ca_file         = "/var/lib/puppet/ssl/certs/ca.pem",
	$ssl_cert_file       = undef,
	$ssl_key_file        = undef
){

	# Puppet does not support variable reassignment
	$lc_hostname = downcase($hostname)
	if $ssl_cert_file == undef {
		$_ssl_cert_file = "/var/lib/puppet/ssl/certs/$lc_hostname.pem"
	}
	else {
		$_ssl_cert_file = $ssl_cert_file
	}

	if $ssl_key_file == undef {
		$_ssl_key_file = "/var/lib/puppet/ssl/private_keys/$lc_hostname.pem"
	}
	else {
		$_ssl_key_file = $ssl_key_file
	}

	case $::operatingsystem {

		'RedHat', 'CentOs' : {


		}

		'ubuntu', 'debian': {

			anchor {"mcollective::begin":} ->
			class {"::mcollective::install":} ->
			class {"::mcollective::configure":} ->
			class {"::mcollective::plugins":} ->
			class {"::mcollective::service":} ->
			anchor {"mcollective::end":}

		}

		default: {

		}

	}


}
