require 'csv'
require 'sqlite3'

$db = SQLite3::Database.new "nl_real_wins.db"


class Model
	def team_year_lookup(team, year) 
    #Takes Team and Year 
  	wins = $db.execute("select #{team} from nl_real_wins where YEAR = #{year}")
	end

	def team_win_totals(team, display = 0) 
    #Takes a Team and A Number 1-24(for display argument)
    range = (2014 - display)
    wins = $db.execute("SELECT #{team},YEAR FROM nl_real_wins WHERE Year >= #{range};")
	end

	def year_lookup(year, display=5) 
    #Takes a year and the number of teams you want to display.  
  hash = Hash.new(0)
  wins = $db.execute("SELECT * from nl_real_wins WHERE YEAR = #{year}")
  names = $category_header
   wins = wins.flatten[2..-1].map!{|value| value == nil ? value.to_i.to_s : value}
  wins.each_index do |index| 
    hash[names[index]] = wins[index]
  end
  hash = hash.sort_by{|k,v| v}.reverse
  hash[0..(display - 1)]
	end
end



class Controller
  def initialize
    @viewer = View.new
    @model = Model.new
  	start
  end

  def start
  	ans1 = @viewer.welcome
  	if ans1 == 'Y' || 'y'
  		ans = @viewer.selection
  		ans
  		p ans
  		go_case(ans)
  	else
  		exit
  	end
  end

  def go_case(ans)
  	case ans
	  	when "1"
	  		team = @viewer.ask_team
	  		year = @viewer.ask_year
	  		wins = @model.team_year_lookup(team, year)
	  		@viewer.team_wins(team, wins, year)
	  	when "2"
	  		team = @viewer.ask_team
	  		range = @viewer.ask_range.to_i
	  		report= @model.team_win_totals(team, range)
	  		@viewer.year_wins(report)
	  	when "3"



  	end

  end

end

class View

	def welcome
		puts "Welcome to the game! Would you like to play? Enter Y/N"
		answer = gets.chomp
	end
	def selection
		puts "1: Lookup Wins for a specific Year and Team:"
		puts "2: Lookup Wins for a team with a range of specific years:"
		puts "3: Lookup Winningest teams for a particular year: "
		gets.chomp
	end

	def ask_team
		puts "Please Enter Your Team: "
		gets.chomp
	end

	def ask_year
		puts "Please Enter Your Year"
		gets.chomp
	end

	def ask_range
		puts "Select your years of history for viewing:"
		gets.chomp
	end

	def team_wins(team, wins, year)
		wins = wins.flatten.join
		p wins
		puts "#{team} won #{wins} games in #{year}."
	end

	def year_wins(report)
		puts "Year            Wins"
    puts "====================" #Look into better implementation here. 
    report[1..-1].each do |report|
    	puts report[1] + "              " + report[0] 
    end
	end

end

Controller.new