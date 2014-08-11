Rails.application.routes.draw do

  devise_for :admins
  root 'gifs#search'
  resources :gifs

end
