require 'CSV'
require 'sqlite3'

db = SQLite3::Database.new "test.db"

cardinals_array = CSV.read("cardinals_roster.csv")
p cardinals_array[0].length

db.execute <<-SQL #creates our table in sqlite
  create table numbers (
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    name varchar(30),
    val int
  ); 


{
  "one" => 1,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
  "two" => 2,
}.each do |pair|
  db.execute "insert into data values ( ?, ? )", pair
end