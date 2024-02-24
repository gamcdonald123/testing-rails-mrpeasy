class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
