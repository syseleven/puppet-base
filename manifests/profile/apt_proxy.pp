class base::profile::apt_proxy(
  $proxy_url = false,
) {
  if $proxy_url {
    # apt.conf

    sys11lib::ensure_key_value { "apt.conf_proxy_${proxy_url}":
      file      => '/etc/apt/apt.conf',
      delimiter => ' ',
      key       => 'Acquire::http::Proxy',
      value     => "\"$proxy_url\";",
    }

    # apt-key does not honor apt.conf, so override default provider setting
    Apt_key <| |> {
      keyserver_options => "http-proxy=$proxy_url",
    }
  }

}
