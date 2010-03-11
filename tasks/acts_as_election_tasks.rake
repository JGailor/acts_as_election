# desc "Explaining what the task does"
# task :acts_as_election do
#   # Task goes here
# end

namespace :db do
  namespace :migrate do
    desc "Run all of the acts_as_election migrations"
    task :acts_as_election => :environment do
      ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
      ActiveRecord::Migration.migrate("vendor/plugins/acts_as_election/lib/db/migrate/", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
      Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
  end
end

