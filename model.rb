require 'csv'

module CSV_Transfer

	def self.format_array 
		array = []
		CSV.foreach('nation_league_wins.csv', 'r'){ |file| array << file}
		teams = array[0][2..-1]
		years = array.transpose[0][1..-1]
		data = array.map!{|sub_array| sub_array[2..-1]}[1..-1]
		# data.each {|line| print line; puts }
		data.map!.with_index do |year, year_index| 
			year.map!.with_index do |score, index| 
			score = {teams[index] => score}
			end
			year = {years[year_index] => year}
		end
		 data.each {|line| print line; puts}
# 		p data
# 		teams.each_with_index do |team, index|
# 			team = {team => data[0][index]}
# 			print team 
# 		end
# puts 

		# data.each_with_index do |line, index|
		# 	print line.unshift(years[index])
		# 	puts
		# end


	end


end

CSV_Transfer.format_array