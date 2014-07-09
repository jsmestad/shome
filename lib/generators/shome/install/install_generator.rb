require 'rails/generators'

module Shome
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    desc "This generator creates all sandbox-related deployment files"

    def create_capfile
      copy_file "Capfile", "Capfile"
    end

    def create_deploy_directory
      empty_directory "config/deploy"
    end

    def create_sandbox_deploy_file
      @hostname = ask("Where is this server being hosted (example: sandbox.myserver.com)?")
      template "sandbox.rb.erb", "config/deploy/sandbox.rb"
    end

    def create_deploy_file
      @app_name = ask("What would you like to name the application to be (example: 'dummy_app')?")
      @git_repo = ask("What is the git url for this application (example: 'git@github.com:jsmestad/dummy_app.git'?")
      template "deploy.rb.erb", "config/deploy.rb"
    end

    def add_gem_dependencies
      gem 'capistrano-unicorn-nginx', group: :development
      gem 'capistrano-safe-deploy-to', '~> 1.1', group: :development
      gem 'capistrano-rails', group: :development
      gem 'capistrano-rbenv', '~> 2.0', group: :development
      gem 'capistrano-postgresql', '~> 3.0', group: :development
    end

    def append_environment_to_database
      return unless File.exist?('config/database.yml')
      unless File.read('config/database.yml').include? 'sandbox:'
        gsub_file 'config/database.yml', /^default:.*\n/, "default: &default\n"
        gsub_file 'config/database.yml', /\z/, "\nsandbox:\n  <<: *default"

        # Since gsub_file doesn't ask the user, just inform user that the file was overwritten.
        puts '       force  config/database.yml'
      end
    end

    def append_environment_to_application_config
      return unless File.exist?('config/application.yml')
      unless File.read('config/application.yml').include? 'sandbox:'
        gsub_file 'config/application.yml', /\z/, "\nsandbox:\n  <<: *defaults"

        # Since gsub_file doesn't ask the user, just inform user that the file was overwritten.
        puts '       force  config/application.yml'
      end
    end

    def output_readme
      readme "README"
    end

    # ACTIONS PERFORMED:
    # * copy Capfile to ./Capfile (see capify! command)
    # * populate and copy deploy.rb.erb to ./config/deploy.rb
    # * create ./config/deploy directory if its not present
    # * populate and copy sandbox.rb.erb to ./config/deploy/sandbox.rb.erb
    # * add sandbox definitions to database.yml (and database.example.yml)
    # * add sandbox definitions to application.yml

    # OUTSTANDING:
    # * add sandbox definitions to secrets.yml (if present)
  end
end
