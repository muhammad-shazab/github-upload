# frozen_string_literal: true

module User
  class ProductsController < ApplicationController
    include ProductCategories
    
    def index
      @products = Product.all
      @total_variants = Variant.all
    end

    def show
      @current_var = Variant.find params[:id]
      @total_variants = Variant.all
      @recomended_vars = Variant.where('product_id LIKE ?', @current_var.product_id.to_s)
    end
  end
end
