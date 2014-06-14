require 'csv'
require 'sqlite3'

module DbFactory
  def self.make_db(file)
    SQLite3::Database.new "file"
  end

  def self.make_array(csv_path)
    array = CSV.read(csv_path)
  end
end

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