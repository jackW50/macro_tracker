class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.datetime :time
      t.integer :user_id 
      t.timestamps
    end
  end
end
