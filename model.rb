require 'csv'

module CSV_Transfer





	def self.csv_turn_to_array
		array = []
		CSV.foreach('nation_league_wins.csv', 'r') do |file| 
			array << file
		end
	array.each{|line| print line; puts} 
	end

end

CSV_Transfer.csv_database