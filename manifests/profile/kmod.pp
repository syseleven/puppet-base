# Loads Kernel modules we need on all nodes.
class base::profile::kmod (
) {
  if $::is_virtual == 'false' {
    kmod::load { 'ipmi_devintf': }
    kmod::load { 'mpt3sas': }
  }

}
