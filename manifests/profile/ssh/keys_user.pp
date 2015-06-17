# Deploys SSH keys from ssh::keys::user.
class base::profile::ssh::keys_user (
  $authorized_keys = hiera('ssh::keys::user', [])
) {
  ssh::authorized_keys{'authorized_keys_user':
      authorized_keys => $authorized_keys,
    }
}
