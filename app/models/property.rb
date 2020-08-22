class Property < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :broker, optional: true
  has_many :photos
  validates_presence_of :name, :address, :rooms, :garage, :price
  validates_numericality_of :rooms, :garage, :price, :bathrooms
end
