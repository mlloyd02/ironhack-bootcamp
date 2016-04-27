class Concert < ActiveRecord::Base
	has_many :comments
	validates :artist, presence: true
  validates :price, numericality: true, presence: true
  validates :venue, presence: true
  validates :city, presence: true
  validates :date, presence: true
  validates :description, presence: true
end
