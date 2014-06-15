require 'csv'
require 'sqlite3'

# module DbFactory #Implement the DB Factory
#   def self.make_db(file)
#     SQLite3::Database.new "file"
#   end

#   def self.csv_2_array(csv_path)
#     array = []
#     CSV.foreach(csv_path, headers: true) do |csv|
#       array << csv
#     end
#     array
#   end
# end


# puts csv_array = DbFactory.csv_2_array("nation_league_wins.csv")
# row_1 = csv_array.shift
# csv_array.each do |csv| 
#   puts csv["Year"]
# end

$db = SQLite3::Database.new "nl_real_wins.db"
nl_array = CSV.read("nation_league_wins.csv")
nl_array[0].delete_at(0)
nl_array[0].delete_at(0)
$category_header = nl_array[0]



class Model
	# def initialize(database)
	# 	@database = SQLite3::Database.new "#{database}.db"
	# end
	# include DbFactory

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
    wins = $db.execute("SELECT * from nl_real_wins WHERE YEAR = #{year}")
    wins = wins.flatten[2..-1].map!{|value| value.to_i}
    names = $category_header
    wins_and_names = wins.zip(names).sort_by {|a, b| a}.reverse #This can be made clearer. 
    wins_and_names[0..(display -1)]
end
end