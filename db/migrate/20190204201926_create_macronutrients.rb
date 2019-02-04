class CreateMacronutrients < ActiveRecord::Migration[5.2]
  def change
    create_table :macronutrients do |t|
      t.string :category
      t.integer :calories_per_gram
      t.timestamps
    end
  end
end
