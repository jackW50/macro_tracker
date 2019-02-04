class CreateFoodCompositions < ActiveRecord::Migration[5.2]
  def change
    create_table :food_compositions do |t|

      t.timestamps
    end
  end
end
