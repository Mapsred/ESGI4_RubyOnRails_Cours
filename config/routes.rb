Rails.application.routes.draw do
  root 'home#index', as: 'home'

  # Routes for pokemons
  resources :pokemons

  # Routes for types
  resources :types

end
