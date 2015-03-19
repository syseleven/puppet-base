# Sets sysctl values from a hash (supplied as parameter and keyed by $name)
define base::resource::sysctls (
  $settings # Hash of sysctl settings
) {
  if ! is_hash($settings) {
      fail('settings must be a hash of sysctl values keyed by sysctl names.')
  }
  sysctl::value { $name:
    value => $settings[$name],
  }
}
