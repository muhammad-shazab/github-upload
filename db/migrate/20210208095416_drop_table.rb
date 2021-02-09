# frozen_string_literal: true

class DropTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :admins
  end
end
