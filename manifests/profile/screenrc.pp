class base::profile::screenrc() {

  file {'/root/.screenrc':
    ensure => file,
    source => "puppet:///modules/$module_name/screenrc",
  }

}
