#
# Cookbook:: jobs-watch-ami-new
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

apt_update 'update_sources' do
  action :update
end

 bash 'install python and other files'do
   code <<-EOH
   ARG DEBIAN_FRONTEND=noninteractive
   RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
   sudo apt-get install dialog apt-utils -y
   sudo apt-get update -y
   sudo apt-get upgrade -y
   sudo apt-get install nginx -y
   sudo apt-get install git -y
   sudo apt-get install python3.7 -y
   curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
   sudo apt-get install nodejs -y
   alias python=python3
   sudo apt-get install python3-pip -y
   sudo apt-get install python-setuptools -y
   sudo apt-get install python3-pytest -y
   sudo apt-get install default-jre -y
   EOH
 end
#package 'python'
#pip install -r app/requirements.txt

bash 'install packages' do
code <<-EOH
pip3 install "atomicwrites"
pip3 install "attrs"
pip3 install "beautifulsoup4"
pip3 install "certifi"
pip3 install "colorama"
pip3 install "idna"
pip3 install "importlib-metadata"
pip3 install "more-itertools"
pip3 install "packaging"
pip3 install "pluggy"
pip3 install "py"
pip3 install "pyodbc"
pip3 install" pyparsing"
pip3 install "pytest"
pip3 install "requests"
pip3 install "setuptools"
pip3 install "six"
pip3 install "soupsieve"
pip3 install "urllib3"
pip3 install "wcwidth"
pip3 install "zipp"
EOH
end

# execute "pip3 install requirements" do
#   command "pip3 install -r /home/ubuntu/code/requirements.txt"
#   cwd '/home/ubuntu'
# end

# directory '/vagrant/' do
#   action :create
#   mode '0777'
# end
#
# directory '/home/vagrant/Downloads' do
#   action :create
#   mode '0777'
# end
#
# file '/home/vagrant/Downloads/ItJobsWatchTop30.cs' do
#   action :create
#   mode '0777'
# end

# remote_directory '/home/vagrant/app' do
#   source 'app'
#   owner 'root'
#   group 'root'
# end

#Ensures pytest has write permission to path of Downloads folder
directory '/' do
  action :create
  mode '0777'
end
