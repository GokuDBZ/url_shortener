require 'base62-rb'

class Link < ApplicationRecord

	def short(link)
		id_to_encode = self.last.id.to_i
		self.slug = Base62.encode(id_to_encode + 1)
        self.origional_url = url
        self.save
	end

	def self.decode(slug)
		slug = slug.gsub(/[a-z]+\//,"")
		decoded_id = Base62.decode(slug)
		Link.find(decoded_id)
	end

	def self.shorten_url(url)
		id_to_encode = Link.last.try(:id).to_i
		link = Link.new
		link.slug =  Base62.encode(id_to_encode + 1)
		link.origional_url = url
        link.save!

        link
	end

	def origional_url
		if read_attribute(:origional_url).include?("http")
			read_attribute(:origional_url)
		else
			"http://#{read_attribute(:origional_url)}"
		end
	end

end