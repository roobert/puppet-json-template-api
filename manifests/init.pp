class json_template_api {
  include json_template_api::install
  include json_template_api::service

  json_template_api::install -> json_template_api::service
}
