#
# Cookbook:: test1
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package_install = node['test1']['package_to_be_installed']

package package_install do
  action :install
end

service package_install do
  action [:enable, :start]
end

cookbook_file '/var/www/html/index.html' do
  source 'index.html'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  notifies :restart, "service[#{package_install}]"
  only_if { ::File.exist?('/var/www/html/index.html') }
end

remote_file '/home/ubuntu/jenkins.war' do
  source 'https://updates.jenkins-ci.org/download/war/2.49/jenkins.war'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


# after creating this file i want to restart my server
#  service package_install do
#   action :restart
#  end
#  but not a good way because we already use it. so use notifies
