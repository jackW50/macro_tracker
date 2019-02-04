class CreateMacronutrients < ActiveRecord::Migration[5.2]
  def change
    create_table :macronutrients do |t|

      t.timestamps
    end
  end
end
