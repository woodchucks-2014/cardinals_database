module CardinalsDatabase
  class CLIView
    def welcome
      puts "Welcome to the game! Would you like to play? Enter Y/N"
    end

    def input
      gets.chomp
    end

    def selection
      puts "1: Lookup Wins for a specific Year and Team:"
      puts "2: Lookup Wins for a team with a range of specific years:"
      puts "3: Lookup Winningest teams for a particular year: "
      puts "4: Exit The Program"
    end

    def ask_team
      puts "Please Enter Your Team: "
      input
    end

    def ask_year
      puts "Please Enter Your Year"
      input
    end

    def ask_range
      puts "Select your years of history for viewing:"
      input
    end

    def team_number
      puts "Please enter the number of teams for display:"
      input
    end

    def team_wins(team, wins, year)
      puts "#{team} won #{wins} games in #{year}."
    end

    def year_wins(stats)
      puts "Year            Wins"
      puts "====================" #Look into better implementation here.
      stats.each do |stat|
        puts stat.year.to_s + "              " + stat.wins.to_s
      end
    end

    def year_lookup(stats)
      puts "Year            Wins"
      puts "===================="
      stats.each do |stat|
        puts stat.year.to_s + "              " + stat.wins.to_s
      end
    end
  end
end
