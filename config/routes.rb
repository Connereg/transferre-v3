Rails.application.routes.draw do
  resources :user_expenses
  resources :transferrable_transactions
  resources :users

  #check out for frontend fetches https://learning.flatironschool.com/courses/4231/pages/authenticating-users?module_item_id=311665

  #for login currently just username no password
  post "/login", to: "sessions#create"
  #allows user to stay logged in 
  get "/auth", to: "users#show"
  #to log the user out 
  delete "/logout", to: "sessions#destroy"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
