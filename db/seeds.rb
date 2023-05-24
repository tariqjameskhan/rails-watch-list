require "json"
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.

puts 'Uploading data...'


url = 'https://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies['results'].each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end

puts 'Finished'
puts 'Finished writing'
# 5.times do
#   list = List.create(
#     name: Faker::Book.genre
#   )
#   5.times do
#     movie = Movie.create(
#       title: Faker::Movie.title,
#       overview: Faker::Movies::Hobbit.quote,
#       rating: rand(0..10),
#       poster_url: Faker::LoremFlickr.image
#     )
#     5.times do
#       bookmark = Bookmark.new(
#         comment: Faker::Movie.quote
#       )
#       bookmark.list = list
#       bookmark.movie = movie
#       bookmark.save!
#     end
#   end
#   puts "List with the ID: #{list.id} has been created"
# end
