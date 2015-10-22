class base::profile::sas3ircu {

  file { '/usr/local/sbin/sas3ircu':
    ensure => file,
    owner  => 'root',
    group  => 'staff',
    mode   => '0755',
    source => "puppet:///modules/$module_name/sas3ircu",
  }

}
