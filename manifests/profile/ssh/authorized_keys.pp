# Wrapper around ssh::authorized_keys (to allow for fancy hash merge in base::role::sshkeys_*)
class base::profile::ssh::authorized_keys (
  $authorized_keys = {},
) {
  class { '::ssh::authorized_keys':
    authorized_keys => $authorized_keys,
  }
}
