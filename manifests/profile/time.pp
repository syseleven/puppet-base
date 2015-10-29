class base::profile::time () {

  class {'::timezone': }

  service { 'ntp':
    ensure => running,
  }

  file { '/etc/ntp.conf':
    ensure  => file,
    source  => "puppet:///modules/$module_name/ntp.conf",
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    require => Package['ntp'],
    notify  => Service['ntp'],
  }

}
