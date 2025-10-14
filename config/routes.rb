Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root to: "homes#top"
  get'home/about', to: 'homes#about', as: 'about'

  resources :taberus
  resources :users, only: [:show, :edit, :update, :index, :destroy]
end
