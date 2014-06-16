module CardinalsDatabase
  class Controller
    def initialize
      @viewer = CLIView.new
    end

    def start #This implementation seems a bit fuzzy, don't u think so?
      @viewer.welcome
      ans1 = @viewer.input

      if ans1 == 'Y' || ans1 == 'y'
        ans = main_menu
      else
        exit
      end

      while ans != '4' #Probably split into another method.
        case ans
        when '1'
          wins_for_year
        when '2'
          wins_over_time
        when '3'
          stats_for_year
        end

        ans = main_menu
      end
    end

    def main_menu
      @viewer.selection
      @viewer.input
    end

    def wins_for_year
      team_name = @viewer.ask_team
      year = @viewer.ask_year

      team = Team.find('name', team_name)
      stat = Stat.where('team_id = ? AND year = ?', [team.id, year]).first
      wins = stat.wins

      @viewer.team_wins(team.name, wins, year)
    end

    def wins_over_time
      team_name = @viewer.ask_team
      range = @viewer.ask_range.to_i

      start_year = 2014 - range

      team = Team.find('name', team_name)
      stats = Stat.where('team_id = ? AND year >= ?', [team.id, start_year])

      @viewer.year_wins(stats)
    end

    def stats_for_year
      year = @viewer.ask_year.to_i
      num_teams = @viewer.team_number.to_i

      stats = Stat.where('year = ?', [year])[0..(num_teams - 1)]

      @viewer.year_lookup(stats)
    end
  end
end
