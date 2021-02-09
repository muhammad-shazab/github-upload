# frozen_string_literal: true

module Admin
  #this is controller for variants of a product admin views
  class VariantsController < ApplicationController
    def create
      @variant = Variant.new(variant_params)
      if @variant.save
        redirect_to admin_admin_products_path
      else
        flash[:error]='Sorry! product not saved try again'
      end
    end
    def buy
      if customer_signed_in?
        @variant = Variant.find(params[:id])
        @product = @variant.product
        if Order.create({ quantity: params[:quantity], customer_id: current_customer.id, variant_id: @variant.id })
          flash[:info] = 'Order placed Successfully'
          redirect_to user_product_path
        else
          flash[:info] = 'Sorry! something went in placing order please try again'
          redirect_to user_product_path
        end
      else
        redirect_to customer_session_path
      end
    end

    private

    def variant_params
      params.require(:variant).permit(:brand_name, :price, :quantity, :color, :gender, :size, :product_image, :product_id)
    end
  end
end
