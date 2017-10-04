Rails.application.routes.draw do
  
  get 'toppages/index'

  root to: 'toppages#index'
  
  #以下もとのコードをいったんコメントアウト
  # root to: 'tasks#index'
  
  
  #resources :tasks
end
