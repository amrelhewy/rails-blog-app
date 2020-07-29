Rails.application.routes.draw do
  root "blogs#index"
  resources :users, only:[:index,:create,:new]
  resources :sessions, only: [:create]
  resources :blogs
  get "log_out"=>"sessions#destroy"
  post "filter"=>"blogs#filter"
end
