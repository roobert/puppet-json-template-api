class json_template_api::service {
  service { 'json_template_api.service':
    ensure   => running,
    enable   => true,
  }
}
