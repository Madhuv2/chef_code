
if node['platform'] == 'ubuntu'
  default['test1']['package_to_be_installed'] = 'apache2'
elsif node['platform'] == 'Redhat'
  default['test1']['package_to_be_installed'] = 'httpd'
end


