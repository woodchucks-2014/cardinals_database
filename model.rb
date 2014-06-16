require './config'

module CardinalsDatabase
  class Model
    def team_year_lookup(team, year)
      # Wins for a team and year

      sql = <<-SQL
        SELECT stats.wins FROM stats
        INNER JOIN teams
        ON teams.id = stats.team_id
        AND teams.name = ?
        AND stats.year = ?;
      SQL

      CardinalsDatabase.db.execute(sql, team, year)[0][0]
    end

    def team_win_totals(team, display = 0)
      #Takes a Team and A Number 1-24(for display argument)

      range = 2014 - display

      sql = <<-SQL
        SELECT stats.year, stats.wins FROM stats
        INNER JOIN teams
        ON teams.id = stats.team_id
        AND teams.name = ?
        AND stats.year >= ?;
      SQL

      CardinalsDatabase.db.execute(sql, team, range)
    end

    def year_lookup(year, display=5)
      #Takes a year and the number of teams you want to display.

      sql = <<-SQL
        SELECT teams.name, stats.wins FROM stats
        INNER JOIN teams
        ON teams.id = stats.team_id
        AND stats.year = ?
        ORDER BY teams.name;
      SQL

      wins = CardinalsDatabase.db.execute(sql, year)
      wins[0..(display-1)]
    end
  end
end
