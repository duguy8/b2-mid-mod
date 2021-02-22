Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #mechanics
  resources :mechanics, only: [:index, :show]

  #amusement_parks
  resources :amusement_parks, only: [:show]
end
