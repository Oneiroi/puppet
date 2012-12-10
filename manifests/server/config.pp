class percona::config {
  # configuration generated here: https://tools.percona.com/configuration/PT9aIT9K
  define mycnf (
    $port                           = 3306,
    $socket                         = '/var/lib/mysql/data/mysql.sock',
    $user                           = 'mysql',
    $default_storage_engine         = 'InnoDB',
    $pid_file                       = '/var/lib/mysql/data/mysql.pid',
    $key_buffer_size                = '32M',
    $myisam_recover                 = 'FORCE,BACKUP',
    $max_allowed_packet             = '16M',
    $skip_name_resolve              = true,
    $innodb                         = 'FORCE',
    $datadir                        = '/var/lib/mysql/data/',
    $log_bin                        = '/var/lib/mysql/data/mysql-bin',
    $expire_log_days                = 14,
    $sync_binlog                    = 1,
    $tmp_table_size                 = '32M',
    $max_heap_table_size            = '32M',
    $query_cache_type               = 0,
    $query_cache_size               = 0,
    $max_connections                = 500,
    $thread_cache_size              = 50,
    $open_files_limit               = 65535,
    $table_definition_cache         = 4096,
    $table_open_cache               = 10240,
    $innodb_flush_method            = 'O_DIRECT',
    $innodb_log_files_in_group      = 2,
    $innodb_log_file_size           = '256M',
    $innodb_flush_log_at_trx_commit = 1,
    $innodb_file_per_table          = 1,
    $innodb_buffer_pool_size        = '6G',
    $log_error                      = '/var/lib/mysql/data/mysql-error.log',
    $log_queries_not_using_indexes  = 1,
    $slow_query_log                 = 1,
    $slow_query_log_file            = '/var/lib/mysql/data/mysql-slow.log',
    $pxc                            = false,
    $wsrep_cluster_address          = 'gcomm://'
    $wsrep_cluster_provider         = '/usr/lib64/libgalera_smm.so',
    $wsrep_cluster_name             = 'pxc',
    $wsrep_node_name                = $hostname,
    $wsrep_sst_method               = 'xtrabackup', 
    $wsrep_sst_auth                 = 'root:changeme'
    $wsrep_sst_receive_address      = $ip,
    $wsrep_node_address             = $ip,
    $wsrep_notify_cmd               = '',
    $wsrep_replicate_myisam         = 0

  ) {
    file{ '/etc/my.cnf':
      content => template('server/my.cnf'),
      ensure  => present,
      notify  => Service['mysql'],
     }
  }
}
