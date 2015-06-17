# Deploys SSH keys from ssh::keys::sys11. Use this class for setups completely
# managed by Syseleven (no customer access required).
class base::role::sshkeys_sys11 (
) {
  include base::profile::ssh::keys_sys11
}
