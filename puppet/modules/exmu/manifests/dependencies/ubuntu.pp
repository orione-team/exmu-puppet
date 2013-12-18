class exmu::dependencies::ubuntu {

  if ! defined(Package['build-essential'])      { package { 'build-essential':      ensure => present } }
  if ! defined(Package['git'])                  { package { 'git':                  ensure => present } }
  if ! defined(Package['libcurl4-openssl-dev']) { package { 'libcurl4-openssl-dev': ensure => present } }
  if ! defined(Package['libxml2-dev'])          { package { 'libxml2-dev':          ensure => present } }
  if ! defined(Package['libxslt-dev'])          { package { 'libxslt-dev':          ensure => present } }

}
