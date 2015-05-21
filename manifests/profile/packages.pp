# Installs various packages.
class base::profile::packages (
) {
  $install_everywhere = [
    'acl',
    'attr',
    'bash-completion',
    'git',
    'ipmitool',
    'moreutils',
    'ntp',
    'sysstat',
    'wget',
    'whois',
  ]

  $purge_everywhere = [
    'eatmydata',
  ]

  $not_on_metal = [
    'avahi-daemon',
    'cloud-init',
  ]

  ensure_packages($install_everywhere)

  package { $purge_everywhere:
    ensure => purged,
  }

  if $::is_virtual == 'false' {
    package { $not_on_metal:
      ensure => purged,
    }
  }

}
