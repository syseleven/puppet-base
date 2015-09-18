class base::profile::bashrc() {

  file_line { 'source_custom_bashrc':
    path  => '/root/.bashrc',
    line  => '. /root/.bashrc.puppet',
  }

  file_line { 'source_custom_ssh-agent':
    path  => '/root/.bashrc',
    line  => '. /root/.bashrc.ssh-agent',
  }

  file_line { 'source_custom_serial':
    path  => '/root/.bashrc',
    line  => '. /root/.bashrc.serial',
  }

  file {'/root/.bashrc.puppet':
    ensure => file,
    source => "puppet:///modules/$module_name/bashrc.puppet",
  }

  file {'/root/.bashrc.ssh-agent':
    ensure => file,
    source => "puppet:///modules/$module_name/bashrc.ssh-agent",
  }

  file {'/root/.bashrc.serial':
    ensure => file,
    source => "puppet:///modules/$module_name/bashrc.serial",
  }

  file {'/root/.environments/':
    ensure  => directory,
  }
}
