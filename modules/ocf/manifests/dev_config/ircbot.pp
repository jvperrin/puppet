class ocf::dev_config::ircbot {
  # TODO: stop copy-pasting this everywhere
  $redis_password = hiera('create::redis::password')
  validate_re($redis_password, '^[a-zA-Z0-9]*$', 'Bad Redis password')

  file {
    '/etc/ocf-ircbot':
      ensure    => directory;

    '/etc/ocf-ircbot/ocf-ircbot.conf':
      content   => template('ocf/dev_config/ocf-ircbot.conf.erb'),
      group     => ocfstaff,
      mode      => '0440',
      show_diff => false;
  }
}
