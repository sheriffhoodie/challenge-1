Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  jsonapi_resources :pages do
    jsonapi_related_resources :headers
    jsonapi_related_resources :links
  end
end
