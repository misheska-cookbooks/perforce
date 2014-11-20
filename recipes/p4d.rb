# include helper methods
::Chef::Recipe.send(:include, Perforce::Helper)

# Create the p4d user
user node['perforce']['p4d']['user'] do
  home node['perforce']['p4d']['p4root']
end

# Create the p4d group
group node['perforce']['p4d']['group'] do
  members node['perforce']['p4d']['user']
end

# Create the home directory
directory node['perforce']['p4d']['p4root'] do
  owner node['perforce']['p4d']['user']
  group node['perforce']['p4d']['group']
  mode '0755'
  recursive true
end

# Create the journal file directory
directory File.dirname(node['perforce']['p4d']['p4journal']) do
  owner node['perforce']['p4d']['user']
  group node['perforce']['p4d']['group']
  mode '0755'
  recursive true
end

# Create the log file directory
directory File.dirname(node['perforce']['p4d']['p4log']) do
  owner node['perforce']['p4d']['user']
  group node['perforce']['p4d']['group']
  mode '0755'
  recursive true
end

p4d_url = get_p4d_url(node['perforce']['p4d']['version'])
p4d_local_path = '/usr/local/bin/p4d'

remote_file p4d_local_path do
  source p4d_url
  mode 0755
end

directory node['perforce']['p4d']['p4root'] do
  recursive true
  owner node['perforce']['p4d']['user']
  group node['perforce']['p4d']['group']
  mode 0755
end

include_recipe 'perforce::_init_service'
