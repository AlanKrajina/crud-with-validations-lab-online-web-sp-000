class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: :released_true?

#  binding.pry

#  validates :release_year,  presence: true, if: :release_year?


  validates :artist_name, presence: true


  def released_true?
    released == true
  end

  def release_year?
#    binding.pry
     release_year.to_i <= Time.now.year
  end
end


# Must be less than or equal to the current year
#   8) Song is invalid when the release year is in the future
