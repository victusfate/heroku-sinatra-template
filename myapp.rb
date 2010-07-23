begin
  # Require the preresolved locked set of gems.
  require ::File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fallback on doing the resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

require 'rubygems'
require 'sinatra'
require 'sinatra/static_assets'
require 'dm-core'
require 'dm-migrations'
require 'json'
require 'httparty'
require 'yaml'
require 'cgi'

# Configure DataMapper to use the App Engine datastore
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
=begin
class User
  include DataMapper::Resource
  property :id, Serial # required for DataMapper
  property :username,      String   # A varchar type string, for short strings
  property :realname,      String   # A varchar type string, for short strings
  has n, :stuff, :through => Resource
end
class Stuff
  include DataMapper::Resource
  property :id, Serial # required for DataMapper
  property :created_at, DateTime # A DateTime, for any date you might like.
  property :name,      String   # A varchar type string, for short strings
  property :body,      Text   # booya text
  has n, :users, :through => Resource
end
=end

#require 'utilities'
#require 'model'

DataMapper.auto_upgrade!

before do
end

get '/' do
  erb :index
end


