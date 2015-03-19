class base::profile::firewall::logging() {
  firewall { '999 logging':
    chain      => 'INPUT',
    jump       => 'LOG',
    log_prefix => 'INPUT DROP: ',
    limit      => '5/min',
  }
}
