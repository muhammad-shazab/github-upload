# frozen_string_literal: true

module User
  class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @customers = Customer.all
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to user_orders_path
    else
      flash[:error] = 'Sorry! something went wrong could not place order.'
      redirect_to user_product_path
    end
  end

  def customer_orders
    @your_orders = Order.where(customer_id: current_customer.id.to_s)
  end

  private

  def order_params
    params.require(:order).permit(:payment, :customer_id, :variant_id)
  end
  end
end
