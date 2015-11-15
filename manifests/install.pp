class json_template_api::install (
  $thin_version = 2.1,
) {
  ensure_resource('package', ['thin', 'grape', 'rack', 'erubis', 'git'],
    {'provider' => 'gem'})

  vcsrepo { '/opt/json_template_api':
    ensure   => latest,
    provider => git,
    branch   => 'master',
    source   => 'https://github.com/roobert/json_template_api.git',
  }

  file { '/etc/systemd/system/json_template_api.service':
    ensure => link,
    target => '/opt/json_template_api/systemd.conf',
    notify => Service['json_template_api'],
  }
}
