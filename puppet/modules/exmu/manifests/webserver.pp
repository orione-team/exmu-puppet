class exmu::webserver (
  $environment   = 'development',
  $hostname      = 'development.exmu.local',
  $app_directory = '/home/exmu'
) {

  class { 'nginx': }

  nginx::resource::upstream { 'exmu_server':
    ensure  => present,
    members => ['localhost:3000']
  }

  if $environment == 'development' {
    nginx::resource::vhost { $hostname:
      ensure      => present,
      proxy       => 'http://exmu_server',
    }
  } else {
    nginx::resource::vhost { $hostname:
      ensure      => present,
      proxy       => 'http://exmu_server/'
    }

    $cache_config = {
     'gzip_static' => 'on',
     'expires'     => 'max',
     'add_header'  => 'Cache-Control public'
    }

    nginx::resource::location { "$hostname-assets":
      ensure              => present,
      ssl                 => true,
      www_root            => "$app_directory/current/public",
      location            => '/assets',
      vhost               => $hostname,
      location_cfg_append => $cache_config,
    }
  }
}
