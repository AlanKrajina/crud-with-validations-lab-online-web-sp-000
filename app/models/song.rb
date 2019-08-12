class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  end
#  binding.pry

#  validates :release_year,  presence: true, if: :release_year?


  validates :artist_name, presence: true



  def released?
    released
  end
end


# Must be less than or equal to the current year
#   8) Song is invalid when the release year is in the future
