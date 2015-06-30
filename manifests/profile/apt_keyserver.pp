class base::profile::apt_keyserver(
  $keyserver = false,
) {
  if $keyserver {
    Apt_key <| |> {
      server => $keyserver,
    }
  }
}
