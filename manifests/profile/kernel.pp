class base::profile::kernel () {

if $::lsbdistid == 'Ubuntu' {

  if $::lsbdistcodename == 'trusty' {

    if $::is_virtual == 'false' {

      package { 'linux-generic':
        ensure => latest,
      }

      package { 'linux-generic-lts-utopic':
        ensure => latest,
      }

    } else {

      package { 'linux-virtual':
        ensure => latest,
      }

      package { 'linux-virtual-lts-utopic':
        ensure => latest,
      }

    }

  }

  file { '/usr/local/sbin/kernel-cleanup':
    ensure => file,
    owner  => 'root',
    group  => 'staff',
    mode   => '0755',
    source => "puppet:///modules/${module_name}/kernel-cleanup.py",
  }

  cron { 'kernel_cleanup':
    command => '/usr/bin/chronic /usr/local/sbin/kernel-cleanup',
    user    => 'root',
    hour    => 2,
    minute  => 25,
    require => [
      Package['moreutils'],
      File['/usr/local/sbin/kernel-cleanup'],
    ]
  }

}

}
