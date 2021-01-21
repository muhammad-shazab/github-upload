class UsersController < ApplicationController
	def index
		@products=Product.all
		@admin=Admin.first
	end
	def new
		@admin=Admin.first
	end

	def show
		@product=Product.find(params[:id])
		@current_var=Variant.find_by product_id: params[:id]
	end
	def verify_admin
		@admin=Admin.first
		if @admin.user_name.to_s==params[:user_name].to_s and @admin.password==params[:password]
			redirect_to products_path
		else
			redirect_to users_path
		end
	end
	def shirts
		@shirt_variants=Array.new
		Variant.all.each do |v|
			@each_product=Product.find_by id: v.product_id			
			if @each_product.category == 'Shirt'
				@shirt_variants.push(v)
			end
	    end
		
	end
	def trousers
		@trouser_variants=Array.new
		Variant.all.each do |v|
			@each_product=Product.find_by id: v.product_id			
			if @each_product.category == 'Trousers'
				@trouser_variants.push(v)
			end
		end
	end

	def shoes
		@shoe_variants=Array.new
		Variant.all.each do |v|
			@each_product=Product.find_by id: v.product_id			
			if @each_product.category == 'Shoes'
				@shoe_variants.push(v)
			end
		end
	end

	def search
		if params[:search].blank?
			redirect_to users_path and return
		else
			@parameter=params[:search].downcase

			@pro=Product.where("lower(category)  LIKE ?","%#{@parameter}%")
			@var=Variant.where("brand_name LIKE ? OR color LIKE ? OR gender LIKE ?", "%#{@parameter}%","%#{@parameter}%","#{@parameter}%")

		end
	end
end
