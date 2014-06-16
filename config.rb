require 'sqlite3'

module CardinalsDatabase
  ROOT_PATH = File.dirname( File.expand_path('./', __FILE__) )
  DB_FILE   = File.join(ROOT_PATH, 'nl_real_wins.db')

  def self.db
    @db ||= SQLite3::Database.new DB_FILE
  end
end
