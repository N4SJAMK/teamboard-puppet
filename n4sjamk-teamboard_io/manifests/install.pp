class teamboard_io::install inherits teamboard_io {

	file { 'tb_io_dir':
		path   => "/home/teamboard/io",
		ensure => directory,
		owner  => "teamboard",
	}

	vcsrepo { '/home/teamboard/io/teamboard-io':
		ensure   => latest,
		provider => git,
		source   => $source,
		revision => $revision,
		notify   => Exec["npm_install"],
		user     => "teamboard",
	}

	exec { 'npm_install':
		command     => "bash -c 'cd /home/teamboard/io/teamboard-io && npm install'",
		path        => ["/bin", "/usr/bin", "/usr/local/bin"],
		user        => "teamboard",
		environment => ["HOME=/home/teamboard"],
		require     => File["tb_io_dir"],
		refreshonly => true,
	}
}
