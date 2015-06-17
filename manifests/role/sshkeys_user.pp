# Deploys SSH keys from ssh::keys::user. Use this class for setups completely
# managed by the user (no access for Syseleven required).
class base::role::sshkeys_user(
) {
  include 'base::profile::ssh::keys_user'
}
