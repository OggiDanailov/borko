Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root "articles#index"

resources :articles

get '/registrations', to: "registration#new"
end
