require ::File.expand_path('../environment', __FILE__)

require 'rake'
require 'jasmine'

load 'jasmine/tasks/jasmine.rake'

desc 'Start IRB with application environment loaded'
task "console" do
    exec "irb -r./environment"
end

namespace :test do
 task :jasmine do
   abort 'No Jasmine run (sudo) gem instal jasmine'
 end
end

namespace :generate do
  task :migration do
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:migration NAME=create_tasks"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
    path     = APP_ROOT.join('db', 'migrate', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{name} < ActiveRecord::Migration
          def change
          end
        end
      EOF
    end
  end
end

namespace :db do
  desc "Drop, create, and migrate the database"
  task :reset => [:drop, :create, :migrate, :seed, "test:prepare"]

  desc "Create the databases at #{DB_NAME}"
  task :create do
    puts "Creating development and test databases if they don't exist..."
    system("createdb #{APP_NAME}_development && createdb #{APP_NAME}_test")
  end

  desc "Drop the database at #{DB_NAME}"
  task :drop do
    puts "Dropping development and test databases..."
    system("dropdb #{APP_NAME}_development && dropdb #{APP_NAME}_test")
  end

  desc "Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
  task :migrate do
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end

  desc "Returns the current schema version number"
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end

  desc "Populate the database with dummy data by running db/seeds.rb"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end

  namespace :test do
    desc "Migrate test database"
    task :prepare do
      system "rake db:migrate RACK_ENV=test"
    end
  end
end



