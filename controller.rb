require_relative 'model'
require_relative 'view'


class Controller
  
  def initialize
    @viewer = View.new
    @model = Model.new
  	start
  end

  def start #This implementation seems a bit fuzzy, don't u think so?
  	ans1 = @viewer.welcome
  	if ans1 == 'Y' || 'y'
  		ans = @viewer.selection
  	else
  		exit
  	end
  	unless ans == 4
  		go_case(ans)
  	
  	end
  end

  def go_case(ans) #U CAN DO BETTER THAN THIS
  	case ans
	  	when "1"
	  		team = @viewer.ask_team
	  		year = @viewer.ask_year
	  		wins = @model.team_year_lookup(team, year)
	  		@viewer.team_wins(team, wins, year)
	  		@viewer.selection # FIX THIS
	  	when "2"
	  		team = @viewer.ask_team
	  		range = @viewer.ask_range.to_i
	  		report= @model.team_win_totals(team, range)
	  		@viewer.year_wins(report)
	  		@viewer.selection #THIS IS BAD DESIGN
	  	when "3"
	  		year = @viewer.ask_year.to_i
	  		p year
	  		num_teams = @viewer.team_number.to_i
	  		p num_teams
	  		report = @model.year_lookup(year, num_teams)
	  		p report
	  		@viewer.year_lookup(report)
	  		@viewer.selection #BRENDAN U R 2 LAZY
			end
	end
end

Controller.new