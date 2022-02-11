class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :dishes
  validates_presence_of :name
end
