class ocf_admin::create::app {
  require ocf_ssl::default_bundle

  package { 'ocf-approve':; }

  file {
    '/etc/ocf-create/create.keytab':
      mode   => '0400',
      source => 'puppet:///private/create.keytab';

    '/etc/ocf-create/create.key':
      mode   => '0400',
      source => 'puppet:///private/create.key';

    '/etc/ocf-create/create.pub':
      mode   => '0444',
      source => 'puppet:///private/create.pub';
  }
}
