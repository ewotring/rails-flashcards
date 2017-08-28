Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :decks
  resources :cards
  resources :sessions
  resources :rounds

  root "decks#index"
end
