class json_template_api::install (
  $thin_version = 2.1,
) {
  ensure_resource('package', ['thin', 'grape', 'rack', 'erubis', 'git'],
    {'provider' => 'gem'})

  file { '/etc/init/json_template_api.conf':
    source => 'puppet:///modules/json_template_api/init.conf',
  }

  vcsrepo { '/opt/json_template_api':
    ensure   => latest,
    provider => git,
    branch   => 'master',
    source   => 'https://github.com/roobert/json_template_api.git',
  }

  file { "/etc/thin${thin_version}/json_template_api.yml":
    ensure => link,
    target => '/opt/json_template_api/thin.yml',
    notify => Service['json_template_api'],
  }
}
