# Configures kdump-tools (persistent kernel panic reports)
class base::profile::kdump (
) {
  ensure_packages(['kdump-tools'])

  file { '/etc/default/kdump-tools':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    source  => "puppet:///modules/${module_name}/kdump-tools.defaults",
    require => Package['kdump-tools'],
  }
}
