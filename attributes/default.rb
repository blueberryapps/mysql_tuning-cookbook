default['mysql_tuning']['service_name'] = node['mysql']['service_name']

# Recommended for small machines (512 MB)
# TODO improve this to be more generic

if Gem::Version.new(node['mysql']['version']) < Gem::Version.new('5.5')
  default['mysql_tuning']['tuning.cnf']['mysqld']['key_buffer'] = '16K'
else
  default['mysql_tuning']['tuning.cnf']['mysqld']['key_buffer_size'] = '16K'
end
default['mysql_tuning']['tuning.cnf']['mysqld']['max_allowed_packet'] = '1M'
default['mysql_tuning']['tuning.cnf']['mysqld']['thread_stack'] = '64K'
# TODO this should compare full versions, not only x.y
if Gem::Version.new(node['mysql']['version']) < Gem::Version.new('5.1.3')
  default['mysql_tuning']['tuning.cnf']['mysqld']['table_cache'] = 4
else
  default['mysql_tuning']['tuning.cnf']['mysqld']['table_open_cache'] = 4
end
default['mysql_tuning']['tuning.cnf']['mysqld']['sort_buffer_size'] = '64K'
default['mysql_tuning']['tuning.cnf']['mysqld']['read_buffer_size'] = '256K'
default['mysql_tuning']['tuning.cnf']['mysqld']['read_rnd_buffer_size'] = '256K'
default['mysql_tuning']['tuning.cnf']['mysqld']['net_buffer_length'] = '2K'
default['mysql_tuning']['tuning.cnf']['mysqld']['thread_stack'] = '64K'

default['mysql_tuning']['logging.cnf']['mysqld']['log_bin'] = 'mysql-bin.log'
default['mysql_tuning']['logging.cnf']['mysqld']['slow_query_log'] = 'ON'
default['mysql_tuning']['logging.cnf']['mysqld']['slow_query_log_file'] = 'slow-query.log'
