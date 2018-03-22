Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {registration: "registration"}
  root "articles#index"

resources :articles
resources :subscribers

get '/registrations', to: "registration#new"
end
