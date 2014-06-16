module CSVParser
  require 'csv'

  def self.parse(file)
    #
    # Returns a nested hash of teams and stats by year, e.g.
    #
    # { TEAM_1 => { YEAR_1 => WINS_1, YEAR_2 => WINS_2, ... YEAR_N => WINS_N },
    #   TEAM_2 => { YEAR_1 => WINS_1, YEAR_2 => WINS_2, ... YEAR_N => WINS_N },
    #   ...
    # }
    #
    teams = {}

    CSV.foreach(file, headers: true) do |year_stats|
      team_names = year_stats.headers[2..-1]

      year = year_stats['Year']

      team_names.each do |name|
        teams[name] ||= {}
        teams[name][year] = year_stats[name]
      end
    end

    teams
  end
end
