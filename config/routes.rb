Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :decks do
    resources :rounds
  end

  resources :cards do
    resources :guesses
  end
  resources :sessions

  root "decks#index"
end
