# Configures grub (adds boot option to raise number of available loop devices).
class base::profile::grub (
) {
  # Required to create additional loop devices (Swift needs more than the default of 8)

  file{'/etc/default/grub':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Exec['grub-mkconfig'],
    source => "puppet:///modules/${module_name}/grub.defaults",
    }

  exec{'grub-mkconfig':
    command     => '/usr/sbin/grub-mkconfig -o /boot/grub/grub.cfg',
    refreshonly => true,
  }
}
