class json_template_api::install (
  $thin_version = 2.1,
) {
  ensure_packages(['thin'])

  ensure_resource('package', ['grape', 'rack', 'erubis', 'git'],
    {'provider' => 'gem'})

  vcsrepo { '/opt/json_template_api':
    ensure   => latest,
    provider => git,
    branch   => 'master',
    source   => 'https://github.com/roobert/json_template_api.git',
  }

  file { "/etc/thin${thin_version}/json_template_api.yml":
    ensure => link,
    target => '/opt/json_template_api/thin.yml',
    notify => Service['thin'],
  }
}
