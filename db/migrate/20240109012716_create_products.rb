class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user ,null: false, foreign_key: true   
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id ,null: false
      t.integer :price ,null: false
      t.integer :condition_id ,null: false   
      t.integer :delivery_cost_id ,null: false 
      t.integer :prefecture_id ,null: false
      t.integer :shipping_date_id 

      t.timestamps
    end
  end
end