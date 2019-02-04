class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|

      t.timestamps
    end
  end
end
