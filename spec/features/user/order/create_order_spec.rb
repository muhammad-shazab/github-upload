require 'rails_helper'

def login_customer(email,password)
	visit user_products_path
	find(:xpath, './/a[@id="customer-login"]').click
	expect(page).to have_content('Login')
	within("#customer-login-form") do
		fill_in 'Email', with: email
		fill_in 'Password', with: password
	    find(:xpath, './/form/div[@id="login-btn"]/input').click
	end
end

RSpec.feature "Users", type: :feature, js: true do
  feature 'user view testing' do
    	let(:customer) {FactoryBot.create(:customer)}
		let(:variant) {create(:variant)}
		# let(:valid_attributes_variant) { attributes_for(:variant) }
	  	scenario 'customer sign in, search a product,buy it and then sign out' do
	  		login_customer(customer.email, customer.password)
	  		expect(page).to have_text('Your History with us')
  		    find('[id=search-input]').fill_in with: 'shirt'
  			find('[id="search-button"]').click
	  		expect(page).to have_current_path("/u-search?search=shirt")
	  		find('[id=product_image1]').click
	  		expect(page).to have_text("Buy")
	  		temp=find('[id=counter-field]')
	  		find('[id=counter-field]').fill_in with: 1
	  		find('[id=buy-btn]').click
	  		expect(page).to have_text("Order placed Successfully") 
	  		accept_alert do
	  			find('[id=sign-out]').click
	  	        page.driver.browser.switch_to.alert.accept
	  	        debugger
	  	    end   
	  	    expect(page).to_not have_text('Your History with us') 
	  	    	
	  	end
    end
end