# Installs various packages.
class base::profile::packages (
) {
  $install_everywhere = [
    'acl',
    'attr',
    'bash-completion',
    'bc',
    'curl',
    'git',
    'hdparm',
    'htop',
    'ipmitool',
    'moreutils',
    'ntp',
    'sdparm',
    'sg3-utils',
    'sysstat',
    'wget',
    'whois',
  ]

  $purge_everywhere = [
    'eatmydata',
    'ufw',
    'ubuntu-release-upgrader-core',
  ]

  $not_on_metal = [
    'avahi-daemon',
    'cloud-init',
  ]

  $not_on_openvz = [
    'avahi-daemon',
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

  if $::virtual == 'openvzve' {
    package { $not_on_openvz:
      ensure => purged,
    }
  }

}
