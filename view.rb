module CardinalsDatabase
  class View
    def welcome
      puts "Welcome to the game! Would you like to play? Enter Y/N"
      answer = gets.chomp
    end

    def selection
      puts "1: Lookup Wins for a specific Year and Team:"
      puts "2: Lookup Wins for a team with a range of specific years:"
      puts "3: Lookup Winningest teams for a particular year: "
      puts "4: Exit The Program"
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

    def team_number
      puts "Please enter the number of teams for display:"
      gets.chomp
    end

    def team_wins(team, wins, year)
      puts "#{team} won #{wins} games in #{year}."
    end

    def year_wins(report)
      puts "Year            Wins"
      puts "====================" #Look into better implementation here.
      report.each do |year, wins|
        puts year.to_s + "              " + wins.to_s
      end
    end

    def year_lookup(output)
      p output
      puts "Year            Wins"
      puts "===================="
      output.each do |year, wins|
        puts year.to_s + "              " + wins.to_s
      end
    end
  end
end
