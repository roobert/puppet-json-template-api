class json_template_api::install (
  $thin_version = 2.1,
) {
  ensure_resource('package', ['thin', 'grape', 'rack', 'erubis', 'git'],
    {'provider' => 'gem'})

  vcsrepo { '/opt/json_template_api':
    ensure   => present,
    provider => git,
    revision => 'master',
    source   => 'https://github.com/roobert/json_template_api.git',
    owner    => 'jt-api',
    group    => 'jt-api',
  }

  file { '/etc/systemd/system/json_template_api.service':
    ensure => link,
    target => '/opt/json_template_api/json_template_api.service',
    notify => Service['json_template_api.service'],
  }
}
