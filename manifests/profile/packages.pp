# Installs various packages.
class base::profile::packages (
) {
  ensure_packages( [
                    'acl',
                    'attr',
                    'bash-completion',
                    'git',
                    'ipmitool',
                    'ntp',
                    'sysstat',
                    'wget',
                    'whois',
                  ])
}
