class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.date :expiration_date
      t.integer :qty
      t.string :description

      t.timestamps null: false
    end
  end
end
