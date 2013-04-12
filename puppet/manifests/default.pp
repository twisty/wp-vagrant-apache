class php {
  package { "php5": ensure => present }
  package { "php5-sqlite": ensure => present }
  package { "php5-mysql": ensure => present }
  package { "php5-cli": ensure => present }
  package { "php5-curl": ensure => present }
}

include php
include mysql
include apache

file { "/var/www":
  ensure => link,
  target => "/vagrant/htdocs",
  force  => true,
}

class { "mysql::server":
  config_hash => {
    "root_password" => "wp-skeleton",
    "bind_address" => "0.0.0.0",
  }
}

database_user { "@localhost":
  ensure => absent,
  require => Class["mysql::server"],
}

mysql::db { "wordpress":
  user     => "wp-skeleton",
  password => "wp-skeleton",
  host     => "%",
  grant    => ["all"],
}

class {"apache::mod::php": }

apache::mod { "rewrite": }
apache::mod { "expires": }
