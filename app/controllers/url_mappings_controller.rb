class UrlMappingsController < ApplicationController
	before_filter :sanitize_url, only: :create
	def show
		url = UrlMapping.find_url(params[:id])
    redirect_to url, status: 301
	end

	def new
		@url = UrlMapping.new
	end

	def create
		@original_url, @short_url = UrlMapping.create_url(params[:url])
		@short_url = "http://" + find_host + "/" + @short_url
		render json: {success: true, short_url: @short_url, original_url: @original_url }
	end
  
  private

  def find_host
  	request.host == "localhost" ? request.host + ":3000" : request.host
  end

	def sanitize_url
    if params[:url].present?
    	true
    else
    	render json: {success: false, message: "Please enter a url"}
    end
	end
end
