# Base configuration for all nodes in our cloud.
class base::role::common (
) {
  class { '::base::profile::password': }
  class { '::base::profile::bashrc': }
  class { '::base::profile::vim': }
  class { '::base::profile::grub': }
  class { '::base::profile::kernel': }
  class { '::base::profile::kdump': }
  class { '::base::profile::kmod': }
  class { '::base::profile::packages': }
  class { '::base::profile::timezone': }
  class { '::base::profile::screenrc': }
  class { '::base::profile::sysctl': }
  class { '::base::profile::motd': }
  class { '::base::profile::logrotate': }
  class { '::base::profile::proposed_updates': }
  class { '::base::profile::apt_proxy': }
  class { '::base::profile::apt_keyserver': }


  if $::is_virtual == 'false' {
    class { '::base::profile::hpssacli': }
    class { '::base::profile::irqbalance': }
  }
}
