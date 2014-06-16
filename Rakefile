require 'rake'

namespace :db do
  desc 'Create database'
  task :create do
    `touch nl_real_wins.db`
  end

  desc 'Drop database'
  task :drop do
    `rm nl_real_wins.db`
  end

  desc 'Setup schema in database'
  task :setup do
    require 'sqlite3'

    schema = File.read('./schema.sql')

    db = SQLite3::Database.new 'nl_real_wins.db'

    db.execute_batch(schema)
  end
end
