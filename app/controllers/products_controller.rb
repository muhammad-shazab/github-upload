class ProductsController < ApplicationController
	def index
		@products=Product.all
		@total_variants=Variant.all
		@p=Product.new
		
		@sizes=[]
		if params[:category].present?
			if params[:category]=="Shirt"
				@sizes=["small","medium","large","xl"]	
				
			elsif params[:category]=="Trousers" or params[:category]=="Shoes"
				@sizes=*(8..60)	
			end
		end

		if request.xhr?
		  respond_to do |format|
		    format.json {
		      render json: {sizes: @sizes}
		    }
		  end
		end
	end

	def new
		@product=Product.new
	end
	def show
		@product = Product.find(params[:id])
	end
	def edit
		@product=Product.find(params[:id])
	end
	def create
		@product=Product.new(product_params)

		if @product.save
			@total_variants=Variant.all
			redirect_to products_path
			products_path
		else
			render :add_product_modal
		end
	end
	def destroy
		@product=Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

	def buy
		@product=Product.find(params[:id])
		new_var=Variant.new
		var_hash=Hash.new
		Variant.all.each do |var|
			if var.product_id==@product.id
				var_q=var.quantity.to_i
				counter=params[:quantity].to_i
				var_q -=counter
				new_var=var
				var.update_attribute(:quantity,var_q)
				if var.quantity <= 0
					@product.destroy
				end	
			end
			var_hash[:name]="#{new_var.brand_name}'s #{@product.category}"
			var_hash[:payment]="#{new_var.price}"
			var_hash[:color]="#{new_var.color}"
			var_hash[:gender]="#{new_var.gender}"
			if customer_signed_in?
				var_hash[:customer]=current_customer.id
			else
				var_hash[:customer]=nil
			end
		end
		#redirect_to :method=>:post,:controller => 'ordres', :action => 'create',:params=>var_hash
		if Order.create(customer: var_hash[:customer], name: var_hash[:name],payment: var_hash[:payment],color: var_hash[:color],gender: var_hash[:gender],quantity: params[:quantity])
			redirect_to orders_path
		flash[:notice]="#{params[:counter]}"
		else
			redirect_to trousers_path
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
			redirect_to products_path and return
		else
			@parameter=params[:search].downcase

			@pro=Product.where("lower(category) LIKE ?","%#{@parameter}%")
			@var=Variant.where("brand_name LIKE ? OR color LIKE ? OR gender LIKE ?", "%#{@parameter}%","%#{@parameter}%","#{@parameter}%")

		end
	end

	private
	def product_params
		params.require(:product).permit(:category,variants_attributes:[:price,:quantity,:gender,:color,:size,:product_image,:brand_name])
	end
end
