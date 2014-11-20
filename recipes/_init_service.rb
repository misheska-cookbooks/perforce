dist_dir, conf_dir = value_for_platform_family(
  ['debian'] => %w( debian default ),
  ['rhel'] => %w( redhat sysconfig )
)

template '/etc/init.d/p4d' do
  source "#{dist_dir}/init.d/p4d.erb"
  mode 0755
  notifies :restart, 'service[p4d]', :delayed
end

template "/etc/#{conf_dir}/p4d" do
  source "#{dist_dir}/#{conf_dir}/p4d.erb"
  mode 0644
  variables(
    p4port: node['perforce']['p4port'],
    p4root: node['perforce']['p4d']['p4root'],
    p4journal: node['perforce']['p4d']['p4journal'],
    p4log: node['perforce']['p4d']['p4log'],
    p4user: node['perforce']['p4d']['user']
  )
  notifies :restart, 'service[p4d]', :delayed
end

service 'p4d' do
  supports restart: true, status: true
  action [:enable, :start]
end
