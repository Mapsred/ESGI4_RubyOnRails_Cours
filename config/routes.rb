Rails.application.routes.draw do
  root 'home#index', as: 'home'

  # Routes for pokemons
  resources :pokemons

  # pokemons :pokemons do
  #   member do
  #     get :index
  #   end
  # end
end
