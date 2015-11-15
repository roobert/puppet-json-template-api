class json_template_api::service {
  service { 'json_template_api':
    ensure   => running,
    enable   => true,
  }
}
