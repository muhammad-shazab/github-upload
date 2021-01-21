class OrdersController < ApplicationController
	def index
		@orders=Order.all
		@customers=Customer.all
	end

	def show
		@order=Order.find(params[:id])
	end

	def create
		@order=Order.new(order_params)
		if @order.save
			redirect_to roders_path
		else
			redirect_to shoes_path
		end
	end

	def customer_orders
		@your_orders=Order.where(customer: "#{current_customer.id}")
	end

	private
	def order_params
		params.require(:order).permit(:name,:payment,:color,:gender,:quantity)
	end

end
