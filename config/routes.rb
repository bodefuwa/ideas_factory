Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users
  
  resources :ideas
   
  # match 'current_user_path' => 'ideas#path', as: :current_user_path 
end
