# Deploys SSH authorized keys from an arbitrary number of ssh::authorized_keys
# style hashes (either in global (default) or the ssh::keys:: name space).
class base::role::sshkeys (
  $key_sources = hiera('ssh::key_sources', split($::sshkeys, '\s+')),
) {

    if $key_sources == [] {
      $_key_sources = concat([ 'ssh::keys::sys11', 'ssh::keys::user' ], ['ssh::authorized_keys::authorized_keys'])
      } else {
      $_key_sources = concat($key_sources, ['ssh::authorized_keys::authorized_keys'])
    }


    $keys_merged = merge_hiera_hashes($_key_sources)

    class { 'base::profile::ssh::authorized_keys':
      authorized_keys => $keys_merged,
      }
}
