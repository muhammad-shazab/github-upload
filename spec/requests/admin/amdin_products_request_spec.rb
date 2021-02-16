require 'rails_helper'

RSpec.describe "Admin::AmdinProducts", type: :request do
	context 'Get #index' do
		it 'returns success responce' do
			get :index
			expect(responce).to be_success
		end	

		it 
	end

end
