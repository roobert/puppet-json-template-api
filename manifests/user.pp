class json_template_api::user {
  user { 'json_template_api_user':
    name    => 'jt-api',
    comment => 'json_template_api user',
    home    => '/opt/json_template_api',
  }
}
