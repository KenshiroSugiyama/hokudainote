Rails.application.routes.draw do
  devise_for :users
  
 
  get 'toppages/index'
  root to: 'toppages#index'
  
  get 'confirmation', to: 'notes#confirm'
  post 'notes' ,to: 'notes#create'
  post 'notes1', to: 'notes#create1'
  resources :notes,only: [:index,:show]
  
  
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
   


  #post '/lectures' , to: 'notes/lectures#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
