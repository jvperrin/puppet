class ocf_www::mod::http2 {
  # Support http2 (rt#5957)
  apache::mod { 'http2':; }

  apache::custom_config { 'http2':
    content => "Protocols h2 http/1.1\n",
  }
}
