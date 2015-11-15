class json_template_api::service {
  service { 'thin':
    ensure => running,
    enable => true,
  }
}
