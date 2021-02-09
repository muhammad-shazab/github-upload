module Admin
  # this controller deals products for admin views
  class AdminProductsController < ApplicationController
    include ProductCategories
    before_action :authenticate_operator!

    def index
      @products = Product.all
      @total_variants = Variant.all
      @pro = Product.new
      @var = Variant.new
    end

    def new
      @product = Product.new
    end

    def show
      @variant_orders = Order.where(variant_id: params[:id])
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_admin_products_path
      else
        flash[:error]='Sorry! product not saved try again'
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to admin_admin_products_path
    end

    def sizes
      @sizes = []
      if params[:product_id].present?
        p = Product.find_by id: params[:product_id]
        case p.category
        when 'Shirt'
          @sizes = %w[small medium large xl]
        when 'Trousers' ||  'Shoes'
          @sizes = *(8..60)
        end
      end
      respond_to do |format|
        format.json do
          render json: { sizes: @sizes }
        end
      end
    end
    private
    def product_params
      params.require(:product).permit(:category)
    end
  end
end
