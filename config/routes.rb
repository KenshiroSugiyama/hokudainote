Rails.application.routes.draw do
  
  post 'my_notes/create'
  get 'my_notes/destroy'
  
  devise_for :users
  
 
  get 'toppages/index'
  root to: 'toppages#index'
  
  get 'confirmation', to: 'notes#confirm'

  get 'my_pages/home', to: 'my_pages#home'
  
  resources :notes,only: [:index,:show]

  resources :sales,only: [:index,:show]
  
  resources :user_profiles , only: [:new, :create,:show,:edit,:update] do 
    collection do
      get 'get_departments'
    end
  end

  
  resources :lectures ,only: [:new,:create],controller: 'notes/lectures' do
    get 'notes/lectures' ,to: 'notes/lectures#new'
      collection do
      get 'get_departments'
      get 'get_educators'
      get 'get_lectures'
      end
  end

  resources :cards, only: [:new,:show,:create] do
    collection do 
      post 'show'
    end
  end




  resources :images ,only: [:new, :create],controller: 'notes/images' 

  resources :information ,only: [:new, :create],controller: 'notes/information' 
  resources :my_notes, only: [:create , :destroy]

  resources :bank_accounts, only: [:new,:create,:show,:edit,:update]


  #post '/lectures' , to: 'notes/lectures#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
