require './lib/minifigures_app'
Mongoid.load!("./config/mongoid.yml", :development)
run MinifiguresApp.adapter
