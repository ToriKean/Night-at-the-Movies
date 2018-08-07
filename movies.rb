# your code, here
require 'pry'
require 'time'
class Movie
  attr_accessor :title, :genre, :start_time

  def initialize(movie_row)
    @title = movie_row[:title]
    @genre = movie_row[:genre]
    @start_time = Time.parse(movie_row[:start_time].strip)
  end

  def showing_after?(arrive_time)
    @start_time >= Time.parse(arrive_time)
  end

  def showing_between?(early_time, late_time)
    @start_time.between?(Time.parse(early_time), Time.parse(late_time))
  end

  def comedy?
    @genre == "Comedy"
  end

  def to_s
    "#{@title} is a #{@genre} film and starts at #{@start_time.strftime("%-I:%M %p")}"
  end
end

movies = [
  { title: "The Princess Bride", genre: "Comedy", start_time: "7:00PM" },
  { title: "Troll 2", genre: "Horror", start_time: "8:15PM" },
  { title: "Pet Cemetery", genre: "Horror", start_time: "8:15PM" },
  { title: "Flight of the Navigator", genre: "Adventure", start_time: "8:17PM" },
  { title: "Teen Witch", genre: "Comedy", start_time: "8:20PM" },
  { title: "The Goonies", genre: "Comedy", start_time: "8:30PM" },
  { title: "Better Off Dead", genre: "Comedy", start_time: "8:45PM" },
  { title: "Weekend at Bernies", genre: "Comedy", start_time: "9:00PM" },
  { title: "The Wizard", genre: "Adventure", start_time: "9:10PM" }
]

movie_objects = []

movies.each do |movie_hash|
  movie_objects << Movie.new(movie_hash)
end

puts movie_objects
puts "The following movies are hilarious:"
puts movie_objects.select { |movie| movie.comedy? }

puts "-----------------------------------------"

time = "8:35 PM"
puts "The following movies are showing after #{time}:"
puts movie_objects.select { |movie| movie.showing_after?(time) }

puts "-----------------------------------------"

time_1 = "7:25 PM"
time_2 = "8:35 PM"
puts "The following movies are showing between #{time_1}-#{time_2}:"
puts movie_objects.select { |movie| movie.showing_between?(time_1, time_2) }
# binding.pry



# require 'time'
#
# class Movie
#   attr_accessor :name, :genre, :start_time
#
#   def initialize(row_hash)
#     @name = row_hash[:name]
#     @genre = row_hash[:genre]
#     @start_time = Time.parse(row_hash[:start_time].strip)
#   end
#
#   def showing_after?(arrival_time)
#     @start_time >= Time.parse(arrival_time)
#   end
#
#   def showing_between?(early_time, late_time)
#     @start_time.between?(Time.parse(early_time), Time.parse(late_time))
#   end
#
#   def comedy?
#     @genre == 'Comedy'
#   end
#
#   def to_s
#     "#{@name} is a #{@genre} film and starts at #{@start_time.strftime("%-l:%M %p")}"
#   end
# end
#
# movies = [
#   { name: "The Princess Bride", genre: "Comedy", start_time: "7:00PM" },
#   { name: "Troll 2", genre: "Horror", start_time: "7:30PM" },
#   { name: "Pet Cemetery", genre: "Horror", start_time: "8:15PM" },
#   { name: "Flight of the Navigator", genre: "Adventure", start_time: "8:17PM" },
#   { name: "Teen Witch", genre: "Comedy", start_time: "8:20PM" },
#   { name: "The Goonies", genre: "Comedy", start_time: "8:30PM" },
#   { name: "Better Off Dead", genre: "Comedy", start_time: "8:45PM" },
#   { name: "Weekend at Bernies", genre: "Comedy", start_time: "9:00PM" },
#   { name: "The Wizard", genre: "Adventure", start_time: "9:10PM" }
# ]
#
# movie_objects = []
#
# movies.each do |movie_hash|
#   movie_objects << Movie.new(movie_hash)
# end
#
# movie_objects #=>
# # [
# #   <Movie:0x007fb9c9be23e8 @genre="Comedy", @name="The Princess Bride", @start_time=2016-06-13 19:00:00 -0400>,
# #   <Movie:0x007fb9c9be1b78 @genre="Horror", @name="Troll 2", @start_time=2016-06-13 19:30:00 -0400>,
# #   <Movie:0x007fb9c9be1718 @genre="Horror", @name="Pet Cemetery", @start_time=2016-06-13 20:15:00 -0400>,
# #   <Movie:0x007fb9c9be12e0 @genre="Adventure", @name="Flight of the Navigator", @start_time=2016-06-13 20:17:00 -0400>,
# #   <Movie:0x007fb9c9be0c78 @genre="Comedy", @name="Teen Witch", @start_time=2016-06-13 20:20:00 -0400>,
# #   <Movie:0x007fb9c9be0d40 @genre="Comedy", @name="The Goonies", @start_time=2016-06-13 20:30:00 -0400>,
# #   <Movie:0x007fb9c9bdb408 @genre="Comedy", @name="Better Off Dead", @start_time=2016-06-13 20:45:00 -0400>,
# #   <Movie:0x007fb9c9bdaaf8 @genre="Comedy", @name="Weekend at Bernies", @start_time=2016-06-13 21:00:00 -0400>,
# #   <Movie:0x007fb9c9bda580 @genre="Adventure", @name="The Wizard", @start_time=2016-06-13 21:10:00 -0400>
# # ]
#
# puts "The following movies are comedies:"
# puts movie_objects.select { |movie| movie.comedy? }
#
# puts "-----------------------------------------"
#
# time = "8:35 PM"
# puts "The following movies are showing after #{time}:"
# puts movie_objects.select { |movie| movie.showing_after?(time) }
#
# puts "-----------------------------------------"
#
# time_1 = "7:25 PM"
# time_2 = "8:35 PM"
# puts "The following movies are showing between #{time_1}-#{time_2}:"
# puts movie_objects.select { |movie| movie.showing_between?(time_1, time_2) }
