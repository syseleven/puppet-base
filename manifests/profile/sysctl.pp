# Sets assorted sysctl values.
class base::profile::sysctl (
  $sysctls = {
    'vm.dirty_background_bytes' => '134217728',
    'vm.dirty_bytes'            => '2147483648',
    'net.ipv4.tcp_ecn'          => '1',
    'net.core.default_qdisc'    => 'fq_codel',
    },
) {

  $sysctls_real = versioncmp($::kernelmajversion, '3.1') ? {
    '-1'    => delete($sysctls, 'net.core.default_qdisc'),
    default => $sysctls,
  }

  if is_hash($sysctls_real)
    {
      $sysctlnames = keys($sysctls_real)
      base::resource::sysctls{$sysctlnames:
        settings => $sysctls_real,
      }
    }
}
