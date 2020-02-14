Rails.application.routes.draw do
  get 'cards/new'
  get 'cards/show'
  get 'my_notes/create'
  get 'my_notes/destroy'
  devise_for :users
  
 
  get 'toppages/index'
  root to: 'toppages#index'
  
  get 'confirmation', to: 'notes#confirm'
  post 'notes' ,to: 'notes#create'
  post 'notes1', to: 'notes#create1'
  resources :notes,only: [:index,:show]
  
  get '/cards/new', to: 'cards#new'
  get '/cards/show', to: 'cards#show'
  post '/cards/create', to: 'cards#create'

  
  resources :lectures ,only: [:new,:create],controller: 'notes/lectures' do
    get 'notes/lectures' ,to: 'notes/lectures#new'
      collection do
      get 'get_departments'
      get 'get_educators'
      get 'get_lectures'
      end
  end



  resources :images ,only: [:new, :create],controller: 'notes/images' 

  resources :information ,only: [:new, :create],controller: 'notes/information' 
  resources :my_notes, only: [:create , :destroy]


  #post '/lectures' , to: 'notes/lectures#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
