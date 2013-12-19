class exmu (
  $hostname         = 'development.exmu.local',
  $environment      = 'development',
  $app_directory    = '/home/exmu',
  $user             = 'exmu',
  $group            = 'exmu',
  $db_host          = 'localhost',
  $db_port          = '5432',
  $db_name          = 'exmu_development',
  $db_username      = 'exmu',
  $db_password      = 'exmu',
  $db_root_password = 'exmu_root',
) {

  class { 'exmu::dependencies': }
  class { 'exmu::ruby': }
  class { 'exmu::user':
    home  => $app_directory,
    user  => $user,
    group => $group
  }

  class { 'exmu::database':
    db_host          => $db_host,
    db_port          => $db_port,
    db_name          => $db_name,
    db_username      => $db_username,
    db_password      => $db_password,
    db_root_password => $db_root_password
  }

  class { 'exmu::webserver':
    environment   => $environment,
    hostname      => $hostname,
    app_directory => $app_directory
  }

  file { "${app_directory}/shared/config/database.yml":
      content => template('exmu/database.yml.erb'),
      owner   => $user,
      group   => $group,
      require => Class['exmu::user']
  }
}
