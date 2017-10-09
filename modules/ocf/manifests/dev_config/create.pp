class ocf::dev_config::create {
  # TODO: stop copy-pasting this everywhere
  $redis_password = hiera('create::redis::password')
  validate_re($redis_password, '^[a-zA-Z0-9]*$', 'Bad Redis password')
  $mysql_password = hiera('create::mysql::password')
  validate_re($mysql_password, '^[a-zA-Z0-9]*$', 'Bad MySQL password')

  $broker = "redis://:${redis_password}@admin.ocf.berkeley.edu:6378"
  $backend = $broker

  file {
    '/etc/ocf-create':
      ensure    => directory;

    # TODO: ideally this file wouldn't be directly readable by staff
    '/etc/ocf-create/ocf-create.conf':
      content   => template('ocf/dev_config/ocf-create.conf.erb'),
      group     => ocfstaff,
      mode      => '0440',
      show_diff => false;
  }
}
