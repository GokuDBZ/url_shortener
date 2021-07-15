Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get '/srj/:slug', controller: "redirect", action: "to"
 get '/short_url', controller: "short_url", action: "getShortenedURL"
 get '/hit_count', controller: "short_url", action: "getHitCount"
 get '/origional_url', controller: "short_url", action: "getOriginalURL"  
end
