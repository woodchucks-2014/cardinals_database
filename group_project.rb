require 'CSV'
require 'sqlite3'

db = SQLite3::Database.new "nl_wins.db"

nl_array = CSV.read("nation_league_wins.csv")

# db.execute("CREATE TABLE nl_wins(
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

 db.execute("INSERT INTO nl_wins(
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
  VALUES(#{nl_array[1][0]},2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18);")



#VALUES(#{nl_array[1][0]}, #{nl_array[1][1]}, #{nl_array[1][2]}, #{nl_array[1][3]}, #{nl_array[1][4]},
          #{nl_array[1][5]}, #{nl_array[1][6]}, #{nl_array[1][7]}, #{nl_array[1][8]}, #{nl_array[1][9]},
          #{nl_array[1][10]}, #{nl_array[1][11]}, #{nl_array[1][12]}, #{nl_array[1][13]}, #{nl_array[1][14]},
          #{nl_array[1][15]}, #{nl_array[1][16]}, #{nl_array[1][17]}, #{nl_array[1][18]});")


   #VALUES(#{nl_array[1][0]}, #{nl_array[1][1]}, #{nl_array[1][2]}, #{nl_array[1][3]}, #{nl_array[1][4]},
          #{nl_array[1][5]}, #{nl_array[1][6]}, #{nl_array[1][7]}, #{nl_array[1][8]}, #{nl_array[1][9]},
          #{nl_array[1][10]}, #{nl_array[1][11]}, #{nl_array[1][12]}, #{nl_array[1][13]}, #{nl_array[1][14]},
          #{nl_array[1][15]}, #{nl_array[1][16]}, #{nl_array[1][17]}, #{nl_array[1][18]});")