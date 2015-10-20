class base::profile::tmpreaper () {

  ensure_packages(['tmpreaper'])

  file_line { 'tmpreaper-safety-switch':
    path    => '/etc/tmpreaper.conf',
    line    => 'SHOWWARNING=false',
    match   => '^SHOWWARNING=',
    require => Package['tmpreaper'],
  }

}
