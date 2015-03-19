class base::profile::hpssacli {

  apt::key { '2689B887':
    key_source => 'http://downloads.linux.hp.com/SDR/repo/mcp/GPG-KEY-mcp',
  }

  apt::key { '5CE2D476':
    key_source => 'http://downloads.linux.hp.com/hpPublicKey2048.pub',
  }

  apt::key { 'B1275EA3':
    key_source => 'http://downloads.linux.hp.com/hpPublicKey2048_key1.pub',
  }

  apt::source { 'hpssacli':
    location    => 'http://downloads.linux.hp.com/SDR/repo/mcp/ubuntu/',
    release     => 'trusty/current',
    repos       => 'non-free',
    key         => 'B1275EA3',
    include_src => false,
  }

  package { 'hpssacli':
    ensure  => installed,
    require => Apt::Source['hpssacli'],
  }

}
