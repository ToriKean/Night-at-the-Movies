# your code, here
require 'time'
class Movie
  attr_reader :title, :genre, :start_time

  def initialize(title, genre, time)
    @title = title
    @genre = genre
    parse_time = Time.parse(time)
    @start_time = parse_time.strftime("%-I:%M %p")
  end

end

pb = Movie.new('The Princess Bride', 'Comedy', '7:00PM')
puts pb.start_time
weekend = Movie.new('Weekend at Bernies', 'Comedy', '9:00PM')
puts weekend.start_time
# [
#   Movie.new('The Princess Bride', 'Comedy', '7:00PM'),
#   Movie.new('Troll 2', 'Horror', '8:15PM'),
#   Movie.new('Pet Cemetery', 'Horror', '8:15PM'),
#   Movie.new('Flight of the Navigator', 'Adventure', '8:17PM'),
#   Movie.new('Teen Witch', 'Comedy', '8:20PM'),
#   Movie.new('The Goonies', 'Comedy', '8:30PM'),
#   Movie.new('Better Off Dead', 'Comedy', '8:45PM'),
#   Movie.new('Weekend at Bernies', 'Comedy', '9:00PM'),
#   Movie.new('The Wizard', 'Adventure', '9:10PM')
# ]
