Rails.application.routes.draw do

  devise_for :admins
  devise_scope :admin do
    get "/login", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy"
  end

  root 'gifs#find'
  resources :gifs, path: '' do
    get 'all', on: :collection, to: 'gifs#index'
    get 'search', on: :collection
  end

end

