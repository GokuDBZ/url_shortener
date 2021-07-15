class RedirectController < ApplicationController
	def to
		slug = params[:slug]
		link = Link.find_by_slug(slug)

		unless link.present?
			render json: {message: "Slug not found in our system"}
		else
			link.tap do |l|
				l.hits += 1
				l.save
			end
			redirect_to link.origional_url
		end
		
	end
end