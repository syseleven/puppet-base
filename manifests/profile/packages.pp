# Installs various packages.
class base::profile::packages (
) {
  ensure_packages( [
                    'acl',
                    'attr',
                    'bash-completion',
                    'git',
                    'ipmitool',
                    'moreutils',
                    'ntp',
                    'sysstat',
                    'wget',
                    'whois',
                  ])
}
