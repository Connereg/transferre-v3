Rails.application.routes.draw do
  resources :user_expenses, only: [:index, :create, :update, :destroy]
  resources :transferrable_transactions, only: [:create, :update]
  resources :users, only: [:index, :update, :destroy]

  #check out for frontend fetches https://learning.flatironschool.com/courses/4231/pages/authenticating-users?module_item_id=311665

  #for login currently just username no password
  post "/login", to: "sessions#create"
  #create new user
  post "/signup", to: "users#create"
  #allows user to stay logged in 
  get "/me", to: "users#show"
  #to log the user out 
  delete "/logout", to: "sessions#destroy"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
