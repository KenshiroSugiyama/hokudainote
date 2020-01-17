Rails.application.routes.draw do
  devise_for :users
  resources :notes ,only: [:create,:destroy]
  get 'notes/new1'
  get 'notes/new2'
  get 'notes/new3'
  get 'notes/new4'
  get 'toppages/index'
  root to: 'toppages#index'
  resources :lectures do
    collection { post :import }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
