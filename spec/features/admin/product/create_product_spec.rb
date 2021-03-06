require 'rails_helper'

def login_operator(email,password)
	visit user_products_path
	find('[id=operator-login]').click
	expect(page).to have_content('Login')
	within("#operator-login-form") do
		fill_in 'Email', with: email
		fill_in 'Password', with: password
		find('[id=login-btn]').click
	end
end

def create_product(attributes)
	find('[id=category-field]').fill_in with: attributes[:category]
	click_button 'Add Product Category'
	expect(page).to have_current_path("/admin/admin_products")
end

RSpec.feature "Products", type: :feature, js: true do
  
  feature 'Product testing' do

  	let(:operator) {FactoryBot.create(:operator)}
		#let(:valid_attributes_operator) { attributes_for(:operator) }
		let(:product) {create(:product)}
		let(:valid_attributes_product) { attributes_for(:product) }
  	scenario 'operator sign in, creating a product and then sign out' do
  	    page.driver.browser.manage.window.resize_to(1600,900)
  		login_operator(operator.email, operator.password)
  		#expect(page).to have_current_path(admin_admin_products_path)
  		within('#btns') do
  			find('[id=new-category]').click
  	    end
  		create_product(valid_attributes_product)
  	end
  end
end