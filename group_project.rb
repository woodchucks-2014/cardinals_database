require 'CSV'
require 'sqlite3'

db = SQLite3::Database.new "nl_real_wins.db"

nl_array = CSV.read("nation_league_wins.csv")

db.execute("CREATE TABLE nl_real_wins(
    YEAR varchar(30),
    GAMES varchar(30),
    ARI varchar(30),
    ATL varchar(30), 
    CHC varchar(30),
    CIN varchar(30),
    COL varchar(30),
    HOU varchar(30),
    LAD varchar(30),
    FLA varchar(30),
    MIL varchar(30),
    NYN varchar(30),
    PHI varchar(30),
    PIT varchar(30),
    SDP varchar(30),
    SFG varchar(30),
    STL varchar(30),
    WSN varchar(30),
    val int
  );")

nl_array.each do |row| 
 db.execute("INSERT INTO nl_real_wins(
    YEAR,
    GAMES,
    ARI,
    ATL,
    CHC,
    CIN,
    COL,
    HOU,  
    LAD,
    FLA,
    MIL,
    NYN,
    PHI,
    PIT,
    SDP,
    SFG,
    STL,
    WSN)     
    VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", row)
end

class Model
end

#