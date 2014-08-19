Rails.application.routes.draw do

  devise_for :admins
  devise_scope :admin do
    get "/login", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy"
  end

  root 'search#index'
  get 'search', to: 'search#search'

  resources :gifs, path: '' do
    get 'all', on: :collection, to: 'gifs#index'
  end

end

