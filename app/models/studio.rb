class Studio < ApplicationRecord
  has_many :movies

  def all_actors
    # Studio.joins(movies: :actors).where("studios.id = movies.studio_id").actors
  end
end
