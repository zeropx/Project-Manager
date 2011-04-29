
namespace :app do
  
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\n Are you insane trying to run this on production? \n 
      Your asking to drop the database in a production site."
    end
  end
  
  desc "Setup by repopulating all information from scratch."
  task :setup => [:ensure_development_environment, 
                  "db:drop", 
                  "db:create", 
                  "db:migrate", 
                  "db:seed", 
                  "app:populate"]
  
  desc "Populate the database with development data."
  task :populate => :environment do
    
    # Projects
    [
      {:title => "Destory the Deathstar"},
      {:title => "Build the Deathstar"},
    ].each do |attributes|
      Project.find_or_create_by_title(attributes)
    end
    
    # People
    [
      {:first_name => "Darth",      :last_name => "Vadar"},
      {:first_name => "Commander",  :last_name => "Praji"},
      {:first_name => "Biggs",      :last_name => "Darklighter"},
      {:first_name => "Luke",       :last_name => "Skywalker"},
      {:first_name => "Han",        :last_name => "Solo"},
      {:first_name => "Princess",   :last_name => "Lea"},
    ].each do |attributes|
      Person.find_or_create_by_first_name_and_last_name(attributes)
    end
    
    # Roles
    [
      {:title => "Planning",    :position => 1},
      {:title => "Implenting",  :position => 2},
      {:title => "Completed",   :position => 3},
      {:title => "Maintaining", :position => 4},
    ].each do |attributes|
      Status.find_or_create_by_title(attributes)
    end
    
    # Associations
    [
      {:title => "Grand Master", :person => Person.find(1), :project => Project.find(1)},
      {:title => "Anti Worker", :person => Person.find(2), :project => Project.find(2)},
      {:title => "Goober", :person => Person.find(3), :project => Project.find(3)},
    ].each do |attributes|
      Role.create(attributes)
    end

    
  end
  
end