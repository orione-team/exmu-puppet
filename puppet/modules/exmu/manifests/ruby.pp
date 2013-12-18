class exmu::ruby {
  $rvm_version  = '1.25.0'
  $ruby_version = '2.0.0-p353'
  $gemset       = 'exmu'

  class { 'rvm':
    version => $rvm_version
  }

  rvm_system_ruby { $ruby_version:
    ensure      => 'present',
    default_use => true,
    require     => Class['rvm']
  }

  rvm_gem {
    "$ruby_version/puppet":
      ensure  => '3.2.0',
      require => Rvm_system_ruby[$ruby_version];
  }

  rvm_gemset { "$ruby_version@$gemset":
    ensure  => present,
    require => Rvm_system_ruby[$ruby_version]
  }

  rvm::system_user { 'exmu': }
}
