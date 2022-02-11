class CreateRestaurantsMenusDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.timestamps
    end

    create_table :menus do |t|
      t.belongs_to :restaurants, index: true
      t.string :name
      t.timestamps
    end

    create_table :dishes do |t|
      t.belongs_to :menus, index: true
      t.string :name
      t.decimal :price, precision: 20, scale: 2
      t.timestamps
    end

    add_index :dishes, [:menu_id, :name], unique: true
  end
end
