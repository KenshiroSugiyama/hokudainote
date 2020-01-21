Rails.application.routes.draw do
  devise_for :users
  
  get 'notes/new1'
  get 'notes/new2'
  get 'notes/new3'
  get 'notes/new4'
  get 'toppages/index'
  root to: 'toppages#index'
  
  
  
  get '/notes/lectures/new', to: 'notes/lectures_controller#new' do
    collection do
      get 'get_departments'
    end
  end
  post '/lectures' , to: 'notes/lectures_controller#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
