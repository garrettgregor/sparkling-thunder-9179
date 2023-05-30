# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
movie_1 = studio_1.movies.create!(title: "Jurassic Park", creation_year: "1995", genre: "action")
movie_2 = studio_1.movies.create!(title: "Oppenheimer", creation_year: "2023", genre: "puzzle")

studio_2 = Studio.create!(name: "Pixar", location: "Brea")
movie_3 = studio_2.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
movie_4 = studio_2.movies.create!(title: "Inside Out", creation_year: "2015", genre: "animation")

actor_1 = Actor.create!(name: "Tom Hanks", age: 62)
actor_2 = Actor.create!(name: "Meryl Streep", age: 73)
actor_3 = Actor.create!(name: "Brad Pitt", age: 55)
actor_4 = Actor.create!(name: "Matt Damon", age: 40)

movie_actor_1 = MovieActor.create!(movie_id: movie_1.id, actor_id: actor_1.id)
movie_actor_2 = MovieActor.create!(movie_id: movie_1.id, actor_id: actor_2.id)
movie_actor_3 = MovieActor.create!(movie_id: movie_1.id, actor_id: actor_3.id)

movie_actor_4 = MovieActor.create!(movie_id: movie_3.id, actor_id: actor_1.id)
movie_actor_5 = MovieActor.create!(movie_id: movie_3.id, actor_id: actor_2.id)
movie_actor_6 = MovieActor.create!(movie_id: movie_3.id, actor_id: actor_4.id)