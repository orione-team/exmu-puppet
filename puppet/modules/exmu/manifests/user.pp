class exmu::user (
  $home,
  $user,
  $group
) {
  group { $group:
    ensure => present,
    before => User[$user]
  }

  user { $user:
    ensure   => present,
    gid      => $group,
    shell    => '/bin/bash',
    home     => $home,
    before   => File[$home]
  }

  file { [$home,
          "$home/.ssh",
          "$home/shared",
          "$home/shared/config"]:
    ensure => 'directory',
    owner  => $user,
    group  => $group
  }

  file { "$home/.ssh/authorized_keys":
    source  => "puppet:///modules/exmu/orione.pub",
    mode    => '600',
    owner   => $user,
    group   => $group,
    require => File["$home/.ssh"]
  }
}
