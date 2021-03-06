class Place < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  validates :name, presence: true, length: {minimum:3}
  validates :address, presence: true
  validates :description, presence: true, length:{maximum:140, minimum:3}
end
