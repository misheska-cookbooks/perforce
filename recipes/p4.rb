# include helper methods
::Chef::Recipe.send(:include, Perforce::Helper)

p4_url = get_p4_url(node['perforce']['version'])
p4_local_path = '/usr/local/bin/p4'

remote_file p4_local_path do
  source p4_url
  mode 0755
end

template '/etc/profile.d/perforce.sh' do
  mode 0755
  source 'perforce.sh.erb'
  variables(
    p4port: node['perforce']['p4port'],
    p4client: node['perforce']['p4client'],
    p4user: node['perforce']['p4user']
  )
end
