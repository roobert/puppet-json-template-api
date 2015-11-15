class json_template_api::install (
  $thin_version = 2.1,
) {
  ensure_packages(['thin'])

  ensure_resource('package', ['grape', 'rack', 'erubis', 'git'],
    {'provider' => 'gem'})

  vcsrepo { '/opt/JSONTemplateApi':
    ensure   => latest,
    provider => git,
    branch   => 'master',
    source   => 'https://github.com/roobert/JSONTemplateAPI.git',
  }

  file { "/etc/thin${thin_version}/JSONTemplateAPI.yml":
    ensure => link,
    target => '/opt/JSONTemplateAPI/thin.yml',
    notify => Service['thin'],
  }
}
