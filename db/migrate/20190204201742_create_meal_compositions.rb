class CreateMealCompositions < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_compositions do |t|
      t.integer :food_servings, default: 1
      t.integer :meal_id
      t.integer :food_id 
      t.timestamps
    end
  end
end
