# Deploys a vim configuration suitable for puppet development.
class base::profile::vim (
  $url = 'git@gitlab.syseleven.de:openstack/vim-config.git',
  $path = '/opt/vim-config',
  ) {
  vcsrepo { 'vim-config':
  ensure   => 'present',
  path     => $path,
  provider => 'git',
  source   => $url,
  } ~>

  exec {'deploy-vim':
    command     => "tar -C $path -cf - . | tar -C /root -xf -",
    path        => '/usr/bin:/bin',
    refreshonly => true,
  }

  ensure_packages(['puppet-lint', 'pylint'])
}
