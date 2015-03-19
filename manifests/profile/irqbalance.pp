class base::profile::irqbalance(
  $enabled = 1,
  $oneshot = 0,
  $options = '--hintpolicy=ignore',
) {
  service { 'irqbalance':
    ensure => running,
    enable => true,
  }


  file { '/etc/default/irqbalance':
    ensure  => file,
    mode    => '0444',
    content => template("$module_name/irqbalance.erb"),
    notify  => Service['irqbalance'],
  }
}
