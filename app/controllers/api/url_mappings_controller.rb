class Api::UrlMappingsController < ApplicationController
	def create
		@original_url, @short_url = UrlMapping.create_url(params[:url])
		if request.host == "localhost"
		  @short_url = "http://" + request.host + ":3000" +  "/" + @short_url
		else
			@short_url = "http://" + request.host + "/" + @short_url
		end
		render json: {short_url: @short_url, original_url: @original_url }
	end
end
