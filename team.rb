module CardinalsDatabase
  class Team
    attr_reader :id, :name

    def initialize(opts = {})
      @id = opts['id']
      @name = opts['name']
    end

    def stats
      Stat.where('team_id = ?', self.id)
    end

    def self.table_name
      'teams'
    end

    def self.find(field, value)
      results = db.execute("SELECT * FROM #{table_name} WHERE #{field} = ?;", value).first
      self.new results
    end

  private

    def self.db
      @db ||= CardinalsDatabase.db
    end
  end
end
