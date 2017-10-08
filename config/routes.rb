Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  # get 'tasks/:id/edit', to: 'tasks#edit'
  
  resources :users, only: [:index, :show, :new, :create]
  
  resources :tasks, only: [:create, :destroy, :show, :edit, :update]
  

  #以下もとのコードをいったんコメントアウト
  #get 'toppages/index'
  # root to: 'tasks#index'
  #resources :tasks
  
end
