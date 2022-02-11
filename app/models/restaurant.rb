class Restaurant < ApplicationRecord
  has_many :menus
  # has_many :dishes, through: :menus

  validates_presence_of :name
end
