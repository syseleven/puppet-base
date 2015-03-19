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
}
