# Adds proposed-updates repo
class base::profile::proposed_updates() {
  apt::source { 'proposed_updates':
    comment  => 'Repo for proposed updates. Should have minor priority',
    location => 'http://archive.ubuntu.com/ubuntu/',
    release  => "${::lsbdistcodename}-proposed",
    repos    => 'restricted main multiverse universe',
  }

  apt::pin { "${::lsbdistcodename}-proposed":
    priority => 16,
  }
}
