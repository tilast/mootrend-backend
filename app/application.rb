# encoding: utf-8
app_env = (ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development' ).to_sym

# require these groups
require 'bundler/setup'
Bundler.require :default, app_env

# override app environment
Sinatra::Application.environment = app_env
puts "Loaded #{Sinatra::Application.environment} environment"

Mongoid.load!("config/mongoid.yml")
puts "Connected to MongoDB"

set :root,     File.expand_path(File.join(File.dirname(__FILE__), '../'))

%w(services models controllers/** serializers/**).each do |folder|
  Dir[File.join(settings.root, "app/#{folder}/*.rb")].sort.each { |f| require f }
end

# For documentation purposes as well
before do
  content_type :json
end