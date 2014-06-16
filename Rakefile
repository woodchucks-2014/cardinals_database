require 'rake'
require 'sqlite3'

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
  task :setup => :create do
    schema = File.read('./schema.sql')

    db = SQLite3::Database.new 'nl_real_wins.db'

    db.execute_batch(schema)
  end

  desc 'Import CSV data'
  task :import => :setup do
    require './csv_parser'

    db = SQLite3::Database.new 'nl_real_wins.db'

    CSVParser.parse('./nation_league_wins.csv').each do |team, stats|
      insert_team_sql = "INSERT INTO teams (name) VALUES (?);"
      insert_stats_sql = "INSERT INTO stats (year, team_id, wins) VALUES (?, ?, ?);"

      db.execute(insert_team_sql, team)

      team_id = db.last_insert_row_id

      stats.each do |year, wins|
        db.execute(insert_stats_sql, [year, team_id, wins])
      end
    end
  end
end
