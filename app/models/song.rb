class Song < ApplicationRecord
  attr_accessor :month, :day, :year


  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: :released_true?
  validate :validate_created_at


  validates :artist_name, presence: true


  def released_true?
    released == true
  end

  def convert_created_at
    begin
      self.created_at = Date.civil(self.year.to_i, self.month.to_i, self.day.to_i)
    rescue ArgumentError
      false
    end
  end

  def validate_created_at
    errors.add("Created at date", "is invalid.") unless convert_created_at
  end

end
