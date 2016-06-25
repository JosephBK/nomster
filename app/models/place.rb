class Place < ActiveRecord::Base
  belongs_to :user
  validates :description, presence: true, length:{maximum:140, minimum:3}
end
