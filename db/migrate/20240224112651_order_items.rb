class OrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity, default: 1, null: false
      t.decimal :item_price_at_purchase, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
