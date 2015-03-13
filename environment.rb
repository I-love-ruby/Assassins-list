ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'

require 'bundler/setup'
require 'rubygems'

require 'uri'
require 'pathname'

require 'erb'
require 'rubygems'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configure do
  set :root, APP_ROOT.to_path
  set :views, File.join(APP_ROOT, "app", "views")
  enable :sessions

register do
  def auth(type)
    condition do
      redirect ('/') unless send("current_#{type}")
    end
  end
 end
end

configure :development do
  register Sinatra::Reloader
end

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

require APP_ROOT.join('database')
