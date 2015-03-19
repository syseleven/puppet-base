# Sets assorted sysctl values.
class base::profile::sysctl (
  $sysctls = {
    'vm.dirty_background_bytes' => '134217728',
    'vm.dirty_bytes'            => '2147483648',
    'net.ipv4.tcp_ecn'          => '1',
    'net.core.default_qdisc'    => 'fq_codel',
    },
) {

  if is_hash($sysctls)
    {
      $sysctlnames = keys($sysctls)
      base::resource::sysctls{$sysctlnames:
        settings => $sysctls,
      }
    }
}
