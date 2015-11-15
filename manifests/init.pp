class json_template_api {
  include json_template_api::install
  include json_template_api::service

  Class['json_template_api::install'] ->
  Class['json_template_api::service']
}
