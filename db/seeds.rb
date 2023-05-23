# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'creating 5 Lists'

5.times do
  list = List.create(
    name: Faker::Book.genre
  )
  5.times do
    movie = Movie.create(
      title: Faker::Movie.title,
      overview: Faker::Movies::Hobbit.quote,
      rating: rand(0..10),
      poster_url: Faker::LoremFlickr.image
    )
    5.times do
      bookmark = Bookmark.new(
        comment: Faker::Movie.quote
      )
      bookmark.list = list
      bookmark.movie = movie
      bookmark.save!
    end
  end
  puts "List with the ID: #{list.id} has been created"
end
puts 'Finished writing'
