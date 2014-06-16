require_relative 'group_project.rb'



  def interface
    command = ""

    while command != "EXIT"
    puts "Please type in your selection"
    puts "-----------------------------"
      command = gets.chomp
      case command
         when "1"
          puts "Enter your team: "
          team = gets.chomp
          puts "Enter year: "
          year = gets.chomp
          wins = team_year_lookup(team, year)
          puts "#{team} won #{wins[0][0]} games in #{year}."
        when "2"
          puts "Please enter your team: "
          team = gets.chomp
          puts "Select years of history for viewing: "
          range = gets.chomp.to_i
          puts output = team_lookup(team, range)
          puts "Year            Wins"
          puts "===================="
          output[1..-1].each do |report|
            puts report[1] + "              " + report[0]
          end

        when "3"
          puts "Please enter the year: "
          year = gets.chomp
          puts "Please enter number of teams for display: "
          team_number = gets.chomp.to_i
          output = year_lookup(year, team_number)
          puts "Year            Wins"
          puts "===================="
          output.each do |report|
            puts report[0] + "              " + report[1]
          end

        end

      end
      puts "Thank you for logging out!"
  end

end


# my_controller.interface




