# frozen_string_literal: true

class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :price
      t.integer :quantity
      t.string :gender
      t.string :color
      t.string :size

      t.timestamps
    end
  end
end
