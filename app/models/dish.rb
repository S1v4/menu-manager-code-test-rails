# Important Dish Rules:
# - The same dish name can not appear in more than one menu
# - The sum of the prices of all dishes in a single menu can not be `77`.
# - Dish names may not start with the letter `E`.
class Dish < ApplicationRecord
  belongs_to :menu

  validates_presence_of :name, :price, :menu
  validates :menu, uniqueness: { scope: :name }
  validate :cumulative_menu_price_not_77
  validate :name_does_not_start_with_e

  private

  def cumulative_menu_price_not_77
    if menu && price && (menu.dishes.sum(:price) + price) == 77
      errors.add :price, "Total menu price cannot be 77."
    end
  end

  def name_does_not_start_with_e
    if name.to_s[0] == 'E'
      errors.add :name, "Name cannot start with 'E'."
    end
  end
end
