class CreateFoodCompositions < ActiveRecord::Migration[5.2]
  def change
    create_table :food_compositions do |t|
      t.integer :macronutrient_grams
      t.integer :food_id
      t.integer :macronutrient_id
      t.timestamps
    end
  end
end
