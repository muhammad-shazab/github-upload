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

def create_variant(attributes)
		#driver = Selenium::WebDriver.for :firefox
		driver = page.driver.browser
		# driver.get "http://localhost:3000/admin/admin_products"
		find('[id=new-variant]').click
		# => drop = Selenium::WebDriver::Support::Select.new(drop)
		drop = driver.find_element(id: 'category-select')
		# choose.select_by(:value, 2).click
		options = drop.find_elements(tag_name: 'option')
		options.each { |option| option.click if option.text == 'Trousers' }

		find('[id=brand-field').fill_in with: attributes[:brand_name]
		find('[id=price-field').fill_in with: attributes[:price]
		find('[id=quantity-field').fill_in with: attributes[:quantity]
		find('[id=female-radio').click
		find('[id=color-field').fill_in with: attributes[:color]

		drop = driver.find_element(id: 'size-select')
		options = drop.find_elements(tag_name: 'option')
		options.each { |option| option.click if option.text == 34 }
		 
		# Capybara.current_session.execute_script(
		#     "document.querySelector(document.getElementById(#imageupload)).removeAttribute('hidden')"
		#   )
		find('[id=imageupload]').attach_file(
        Rails.root.join("app", "assets", "images", "elo.png")
      )
		# find('[id=image-field]').fill_in with: attributes[:product_image]
		click_button 'Add Variant'
end

RSpec.feature "Variants", type: :feature, js: true do
  
  feature 'variant testing' do
  	
    	let(:operator) {create(:operator)}
		let(:valid_attributes_operator) { attributes_for(:operator) }
		let(:variant) {create(:variant)}
		let(:valid_attributes_variant) { attributes_for(:variant) }
	  	scenario 'operator sign in, creating add variant and then sign out' do
  	      page.driver.browser.manage.window.resize_to(1600,900)
	  		login_operator(operator.email, operator.password)
	  		create_variant(valid_attributes_variant)
	        expect(page).to have_current_path("/admin/admin_products")
	  	end
    end
end