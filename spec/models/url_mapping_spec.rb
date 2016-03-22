require 'rails_helper'
#rspec spec/models/url_mapping_spec.rb --format progress --format documentation
describe UrlMapping do
	it "has url" do
		url_mapping = UrlMapping.new(url: 'http://www.google.com')
		expect(url_mapping.save).to be true
  end
	it "is invalid without url" do
		url_mapping = UrlMapping.new
		expect {url_mapping.save! }.to raise_error(ActiveRecord::RecordInvalid)
	end
end