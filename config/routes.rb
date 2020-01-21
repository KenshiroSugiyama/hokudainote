Rails.application.routes.draw do
  devise_for :users
  
  get 'notes/new1'
  get 'notes/new2'
  get 'notes/new3'
  get 'notes/new4'
  get 'toppages/index'
  root to: 'toppages#index'
  
  
  
  resources :lectures ,only: [:new,:create],controller: 'notes/lectures' do
    get 'notes/lectures' ,to: 'notes/lectures#new'
      collection do
      get 'get_departments'
      get 'get_educators'
      end
  end

  #post '/lectures' , to: 'notes/lectures#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
