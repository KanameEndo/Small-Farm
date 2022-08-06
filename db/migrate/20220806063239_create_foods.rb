class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :item_name
      t.string :variety
      t.text :comment
      t.string :storage_method
      t.string :harvest
      t.string :price
      t.integer :stock
      t.string :image

      t.timestamps
    end
  end
end
