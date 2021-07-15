class ShortUrlController < ApplicationController
	before_action :validate_params, only: [:getShortenedURL]
    
	def getShortenedURL
		url_to_short = params[:url]
		link = Link.where(origional_url: params[:url]).first
		unless link.present?
          link = ApplicationRecord.transaction do 
		      Link.shorten_url(url_to_short)
		  end
		end

		render json: {short_url: "srj/#{link.slug}"}
	end

	def getOriginalURL
		slug = params[:slug]
		link = Link.decode(slug)
		url = link.try(:origional_url)
		unless link.present?
			render json: {message: "No url found for this slug", slug: params[:slug]}
		else
			render json: {origional_url: url, slug: params[:slug]}
		end
		
	end

	def getHitCount
		slug = params[:slug]
		link = Link.decode("srj/#{slug}")

		unless link.present?
			render json: {message: "No url found for this slug", slug: params[:slug]}
		else
			render json: {hit_count: link.hits, slug: params[:slug]}
		end
	end

	def validate_params
		unless params[:url].present? 
			render json: {error_message: "Please provide url to be shortened"}
		end
	end
end 