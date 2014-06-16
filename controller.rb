module CardinalsDatabase
  class Controller
    def initialize
      @viewer = View.new
      @model = Model.new
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
      team = @viewer.ask_team
      year = @viewer.ask_year
      wins = @model.team_year_lookup(team, year)
      @viewer.team_wins(team, wins, year)
    end

    def wins_over_time
      team = @viewer.ask_team
      range = @viewer.ask_range.to_i
      report= @model.team_win_totals(team, range)
      @viewer.year_wins(report)
    end

    def stats_for_year
      year = @viewer.ask_year.to_i
      num_teams = @viewer.team_number.to_i
      report = @model.year_lookup(year, num_teams)
      @viewer.year_lookup(report)
    end
  end
end
