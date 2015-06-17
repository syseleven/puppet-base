# Deploys SSH keys from both ssh::keys::sys11 and ssh::keys::user. Use this
# class for setups with managed in concert by both Syseleven and the customer.
class base::role::sshkeys_all (
) {
  include base::profile::ssh::keys_sys11
  include base::profile::ssh::keys_user
}
