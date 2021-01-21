class AddBrandNameToVariants < ActiveRecord::Migration[6.0]
  def change
    add_column :variants, :brand_name, :string
  end
end
