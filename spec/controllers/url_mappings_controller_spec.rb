require 'rails_helper'
RSpec.describe UrlMappingsController, :type => :controller do
	describe "Shortener API" do
		context 'new shortened url' do
			before do
				post :create, format: :json, :url => "www.google.com"
			end
		  it 'returns shortened url and original url' do
		    json = JSON.parse(response.body)
		    expect(response.status).to eq(200)
		    expect(json['success']).to be true
		  end
		end
		context 'new shortened url without original url' do
			before do
				post :create, format: :json, :url => ""
			end
		  it 'returns false without url' do
		    json = JSON.parse(response.body)
		    expect(response.status).to eq(200)
		    expect(json['success']).to be false
		  end
		end
	end
end