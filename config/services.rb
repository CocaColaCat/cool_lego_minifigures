require 'service_manager'

ServiceManager.define_service "start_mongodb" do |s|
  s.start_cmd = "mongod --pidfilepath mongod.pid"
  s.cwd = Dir.pwd
  s.pid_file = 'mongod.pid'
end
