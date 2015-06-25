# Deploys SSH authorized keys from an arbitrary number of ssh::authorized_keys
# style hashes (either in global (default) or the ssh::keys:: name space).
class base::role::sshkeys (
  $key_sources = hiera('ssh::key_sources', split($::sshkeys, '\s+')),
) {

    # Accomodate project-config repositories that still use the old mechanism's
    # ssh::authorized_keys::authorized_keys variable. This will only be added
    # to the list of key sources if it actually exists.
    $keys_legacy = hiera('ssh::authorized_keys::authorized_keys', {})

    if empty($key_sources) {
      if ! empty($keys_legacy) {
        $_key_sources = concat([ 'ssh::keys::sys11', 'ssh::keys::user' ], ['ssh::authorized_keys::authorized_keys'])
        } else {
          $_key_sources = [ 'ssh::keys::sys11', 'ssh::keys::user' ]
        }
      } else {
        if ! empty($keys_legacy) {
          $_key_sources = concat($key_sources, ['ssh::authorized_keys::authorized_keys'])
        } else {
          $_key_sources = $key_sources
        }
    }


    $keys_merged = merge_hiera_hashes($_key_sources)

    class { 'base::profile::ssh::authorized_keys':
      authorized_keys => $keys_merged,
      }
}
