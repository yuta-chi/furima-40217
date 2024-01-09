class CreateProductConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_conditions do |t|

      t.timestamps
    end
  end
end
