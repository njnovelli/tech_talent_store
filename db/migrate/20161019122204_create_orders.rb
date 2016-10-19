class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :grand_total
      t.references :user, foreign_key: true
      t.text :order_items
      t.decimal :sales_tax

      t.timestamps
    end
  end
end
