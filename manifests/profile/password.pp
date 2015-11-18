# Sets a root password.
class base::profile::password (
$password = undef
) {
  if ! $password {
    fail('Parameter "password" must not be unset.')
  }
  else {
    user { 'root':
      password => $password,
    }
  }

  if $::is_virtual == 'false'
    {
    exec { 'remove bootstrap password from issue':
      provider => shell,
      command  => "sed -i '/^root password:/,+1d' /etc/issue",
      onlyif   => "grep '^root password:' /etc/issue",
      require  => User['root'],
      }
    }
}
