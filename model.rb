require 'csv'
require 'sqlite3'

module DbFactory #Implement the DB Factory
  def self.make_db(file)
    SQLite3::Database.new file
  end

  def self.csv_2_array(csv_path)
    csv_array =[]
    CSV.foreach(csv_path) do |csv|
      csv_array << csv
    end
    csv_array
  end

  def find_header(array)
    array[0]
  end

end

class Model
	include DbFactory
  attr_reader :database, :nl_array

  def initialize
		@database = DbFactory.make_db('nl_real_wins.db')
    @nl_array = DbFactory.csv_2_array("nation_league_wins.csv")
	end


	def team_year_lookup(team, year)
    #Takes Team and Year
  	wins = @database.execute("select #{team} from nl_real_wins where YEAR = #{year}")
	end

	def team_win_totals(team, display = 0)
    #Takes a Team and A Number 1-24(for display argument)
    range = (2014 - display)
    wins = @database.execute("SELECT #{team},YEAR FROM nl_real_wins WHERE Year >= #{range};")
	end

	def year_lookup(year, display=5)
    #Takes a year and the number of teams you want to display.
    wins = @database.execute("SELECT * from nl_real_wins WHERE YEAR = #{year}")
    wins = wins.flatten[2..-1].map!{|value| value.to_i}
    names = find_header(@nl_array)
    wins_and_names = wins.zip(names).sort_by {|a, b| a}.reverse #This can be made clearer.
    wins_and_names[0..(display -1)]
  end
end

# model = Model.new

# p model.year_lookup(2014, 5)
