# == Class: percona
#
# Provides installation and configuration support for Percona Serer and Percona XtraDB cluster.
#
# === Parameters
#
# Document parameters here.
#
# [*pxc*]
#   true or false, to specify if pxc (Percona XtraDB Cluster) to to be installed and configured, 
#   defaults to Percona server if false.
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { percona:
#    pxc => true,
#  }
#
# === Authors
#
# David Busby <oneiroi@fedoraproject.org>
#
# === Copyright
#
# Copyright 2012 David Busby, unless otherwise noted.
#
class percona {
  case $operatingsystem {
   /(centos|fedora|redhat|scientific)/ :{
    $my_cnf_path  = '/etc/my.cnf'
    $my_data_dir  = '/var/lib/mysql'
    $my_sock_file = '/var/lib/mysql/mysql.sock'
    $my_pid_file  = '/var/lib/mysql/mysql.pid'
    $my_err_log   = '/var/log/mysql-error.log'
   }
   /(debian|ubuntu)/: {
    $my_cnf_path  = '/etc/mysql/my.cnf'
    $my_data_dir  = '/var/lib/mysqld'
    $my_sock_file = '/var/run/mysqld/mysql.sock'
    $my_pid_file  = '/var/run/mysqld/mysql.pid'
    $my_err_log   = '/var/log/mysql/error.log'
   }
   default: { fail "${operatingsystem} is not supported :(" }
  } 
}
