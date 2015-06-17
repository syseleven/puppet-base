# Deploys SSH keys from ssh::keys::sys11.
class base::profile::ssh::keys_user (
  $authorized_keys = hiera('ssh::keys::sys11', [])
) {
  ssh::authorized_keys{'authorized_keys_user':
      authorized_keys => $authorized_keys,
    }
}
