class ocf_admin::create {
  include ocf::dev_config::create
  include ocf_admin::create::app
  include ocf_admin::create::redis
}
