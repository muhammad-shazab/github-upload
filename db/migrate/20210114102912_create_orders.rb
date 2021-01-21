class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.string :color
      t.string :gender

      t.timestamps
    end
  end
end
