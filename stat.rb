module CardinalsDatabase
  class Stat
    attr_reader :id, :team_id, :year, :wins

    def initialize(opts = {})
      @id = opts['id']
      @team_id = opts['team_id']
      @year = opts['year']
      @wins = opts['wins']
    end

    def team
      Team.find('id', team_id)
    end

    def self.table_name
      'stats'
    end

    def self.where(condition, values)
      results = db.execute("SELECT * FROM #{table_name} WHERE #{condition}", values)
      results.map { |record| new record }
    end

  private

    def self.db
      @db ||= CardinalsDatabase.db
    end
  end
end
