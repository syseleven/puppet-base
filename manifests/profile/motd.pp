class base::profile::motd () {
  # this file leads to massive amount of wasted time at login
  file {'/etc/update-motd.d/50-landscape-sysinfo':
    ensure => absent,
  }
}
