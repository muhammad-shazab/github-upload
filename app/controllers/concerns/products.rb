# frozen_string_literal: true

module ProductCategories
  include ActiveSupport::Concern
  def shirts
    @shirt_variants = Variant.joins(:product).where('category LIKE ?', 'Shirts')
  end

  def trousers
    @trouser_variants = Variant.joins(:product).where('category LIKE ?', 'Trousers')
  end

  def shoes
    @shoe_variants = Variant.joins(:product).where('category LIKE ?', 'Shoes')
  end

  def search
    if params[:search].blank?
      redirect_to admin_admin_products_path and return
    else
      @total_variants = Variant.all
      @parameter = params[:search].downcase
      @search_var = Variant.joins(:product).where('category LIKE ? OR brand_name LIKE ? OR color LIKE ? OR gender LIKE ?',
                                                  "%#{@parameter}%", "%#{@parameter}%", "%#{@parameter}%", "#{@parameter}%")
    end
  end
end
