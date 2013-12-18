class { 'exmu':
  hostname         => '',
  environment      => 'development',
  app_directory    => '/home/exmu',
  user             => 'exmu',
  group            => 'exmu',
  db_host          => 'localhost',
  db_port          => '3306',
  db_name          => 'exmu_development',
  db_username      => 'exmu',
  db_password      => 'exmu',
  db_root_password => 'exmu_root'
}

