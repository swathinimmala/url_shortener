class UrlMapping < ActiveRecord::Base
	extend Shortener

	validates :url, presence: true

	def self.find_url(shortened_url)
    url_id = self.decode(shortened_url)
    url = self.find(url_id)
    url.url
	end

	def self.create_url(big_url)
		url = self.new(url: big_url)
    url.save
		short_url = self.encode(url.id)
		return url.url, short_url
	end
end