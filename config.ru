require ::File.expand_path('../environment',  __FILE__)

set :app_file, __FILE__
run Sinatra::Application
