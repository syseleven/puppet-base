# Deploys SSH authorized keys from an arbitrary number of ssh::authorized_keys
# style hashes (either in global (default) or the ssh::keys:: name space).
class base::role::sshkeys (
  $key_sources = hiera('ssh::key_sources', []),
  $namespace = hiera('ssh::key_namespace', undef),
) {
    $keys_merged = merge_hiera_hashes($key_sources, $namespace)

    class { 'base::profile::ssh::authorized_keys':
      authorized_keys => $keys_merged,
      }
}
