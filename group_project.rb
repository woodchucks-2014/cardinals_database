require 'CSV'
require 'sqlite3'

$db = SQLite3::Database.new "nl_real_wins.db"

nl_array = CSV.read("nation_league_wins.csv")
nl_array[0].delete_at(0)
nl_array[0].delete_at(0)
$category_header = nl_array[0]

# db.execute("CREATE TABLE nl_real_wins(
#     YEAR varchar(30),

#     GAMES varchar(30),
#     ARI varchar(30),
#     ATL varchar(30), 
#     CHC varchar(30),
#     CIN varchar(30),
#     COL varchar(30),
#     HOU varchar(30),
#     LAD varchar(30),
#     FLA varchar(30),
#     MIL varchar(30),
#     NYN varchar(30),
#     PHI varchar(30),
#     PIT varchar(30),
#     SDP varchar(30),
#     SFG varchar(30),
#     STL varchar(30),
#     WSN varchar(30),
#     val int
#   );")

# nl_array.each do |row| 
#  db.execute("INSERT INTO nl_real_wins(
#     YEAR,
#     GAMES,
#     ARI,
#     ATL,
#     CHC,
#     CIN,
#     COL,
#     HOU,  
#     LAD,
#     FLA,
#     MIL,
#     NYN,
#     PHI,
#     PIT,
#     SDP,
#     SFG,
#     STL,
#     WSN)     
#     VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", row)
# end

def team_year_lookup(team, year)
  wins = $db.execute("select #{team} from nl_real_wins where YEAR = #{year}")
end

def team_lookup(team, display = 0) 
    range = (2014 - display)
    wins = $db.execute("SELECT #{team},YEAR FROM nl_real_wins WHERE Year >= #{range};")
end

def year_lookup(year, display=5)
  hash = Hash.new(0)
  wins = $db.execute('SELECT * from nl_real_wins WHERE YEAR = 2014')
  names = $category_header
   wins = wins.flatten[2..-1].compact
  wins.each_index do |index| 
    hash[names[index]] = wins[index]
  end
  hash = hash.sort_by{|k,v| v}.reverse
  hash[0..(display - 1)]
end

# p $category_header

# p team_year_lookup("ATL", 2012)  
# p team_lookup("ATL", 5)
p year_lookup(2012,)