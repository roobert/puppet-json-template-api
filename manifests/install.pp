class json_template_api::install {
  vcsrepo { '/opt/JSONTemplateApi':
    provider => git,
    branch   => 'master',
    source   => 'https://github.com/roobert/JSONTemplateAPI.git',
  }

  file { '/etc/thin2.2/JSONTemplateAPI.yml':
    ensure => link,
    target => '/opt/JSONTemplateAPI/thin.yml',
    notify => Service['thin'],
  }
}
