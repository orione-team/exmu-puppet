class exmu::database (
  $db_host          = 'localhost',
  $db_port          = '5432',
  $db_name          = 'exmu_development',
  $db_username      = 'exmu',
  $db_password      = 'exmu',
  $db_root_password = 'exmu_root',
) {

  package { 'postgresql-9.1':
   ensure => 'installed'
  }
}
