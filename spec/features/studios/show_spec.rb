require "rails_helper"

RSpec.describe "/studios/:id", type: :feature do
  describe "show" do
    before(:each) do
      @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      @movie_1 = @studio_1.movies.create!(title: "Jurassic Park", creation_year: "1995", genre: "action")
      @movie_2 = @studio_1.movies.create!(title: "Oppenheimer", creation_year: "2023", genre: "puzzle")

      @studio_2 = Studio.create!(name: "Pixar", location: "Brea")
      @movie_3 = @studio_2.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
      @movie_4 = @studio_2.movies.create!(title: "Inside Out", creation_year: "2015", genre: "animation")

      @actor_1 = Actor.create!(name: "Tom Hanks", age: 62)
      @actor_2 = Actor.create!(name: "Meryl Streep", age: 73)
      @actor_3 = Actor.create!(name: "Brad Pitt", age: 55)
      @actor_4 = Actor.create!(name: "Matt Damon", age: 40)

      @movie_actor_1 = MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_1.id)
      @movie_actor_2 = MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_2.id)
      @movie_actor_3 = MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_3.id)

      @movie_actor_4 = MovieActor.create!(movie_id: @movie_3.id, actor_id: @actor_1.id)
      @movie_actor_5 = MovieActor.create!(movie_id: @movie_3.id, actor_id: @actor_2.id)
      @movie_actor_6 = MovieActor.create!(movie_id: @movie_3.id, actor_id: @actor_4.id)
      # ^ Added 6 and revised 4 and 5 for this test to show that @actor_4 belongs to @studio_2 and therefor shouldn't appear on @studio_1's show page
    end

    # Extension
    # Studio's Actors

    # As a user,
    # When I visit a studio's show page
    # I see the studio's name and location
    # And I see a unique list of all of the actors that have worked on any of this studio's movies.
    xit "lists a studio's actors" do
      visit "/studios/#{@studio_1.id}"

      expect(page).to have_content("Studio Name: #{@studio_1.name}")
      expect(page).to have_content("Studio Location: #{@studio_1.location}")
      expect(page).to have_content(@actor_1.name)
      expect(page).to have_content(@actor_2.name)
      expect(page).to have_content(@actor_3.name)
      expect(page).to_not have_content(@actor_4.name)

      visit "/studios/#{@studio_2.id}"

      expect(page).to have_content("Studio Name: #{@studio_2.name}")
      expect(page).to have_content("Studio Location: #{@studio_2.location}")
      expect(page).to have_content(@actor_1.name)
      expect(page).to have_content(@actor_2.name)
      expect(page).to have_content(@actor_4.name)
      expect(page).to_not have_content(@actor_3.name)
    end
  end
end
