class base::profile::hpssacli {

  apt::key { 'FB410E68CEDF95D066811E95527BC53A2689B887':
    key_source => 'http://downloads.linux.hp.com/hpPublicKey1024.pub',
  }

  apt::key { '476DADAC9E647EE27453F2A3B070680A5CE2D476':
    key_source => 'http://downloads.linux.hp.com/hpPublicKey2048.pub',
  }

  apt::key { '882F7199B20F94BD7E3E690EFADD8D64B1275EA3':
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
