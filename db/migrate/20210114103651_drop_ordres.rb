# frozen_string_literal: true

class DropOrdres < ActiveRecord::Migration[6.0]
  def change
    drop_table :ordres
  end
end
