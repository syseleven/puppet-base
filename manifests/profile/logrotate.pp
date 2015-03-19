class base::profile::logrotate() {
  file { '/etc/logrotate.d/upstart':
    ensure => file,
    mode   => '0444',
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/$module_name/logrotate_upstart",
  }
}
