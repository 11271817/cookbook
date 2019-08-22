#
# Cookbook:: try
# Recipe:: default
#

package 'httpd' do
action :install
end

service 'httpd' do
action :start
end

package 'java' do
action :install
end

bash 'tomcat7' do
 user 'root'
 cwd '/opt'
 code <<-EOH
 wget http://us.mirrors.quenda.co/apache/tomcat/tomcat-7/v7.0.96/bin/apache-tomcat-7.0.96.zip
 unzip apache-tomcat-7.0.96.zip
 cd apache-tomcat-7.0.96/bin
 chmod 755 *.sh*
 ./startup.sh
rm -rf /opt/apache-tomcat-7.0.96.zip
EOH
end

bash 'tomcat8' do
 user 'root'
 cwd '/usr/local'
 code <<-EOH
 wget https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.zip
 unzip apache-tomcat-8.5.45
 cd apache-tomcat-8.5.45/bin
 chmod 755 *.sh*
 ./startup.sh
rm -rf /usr/local/apache-tomcat-8.5.45.zip
EOH
end




# Copyright:: 2019, The Authors, All Rights Reserved.
