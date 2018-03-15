Rails.application.routes.draw do
  root "articles#index"

  get "/articles/new" => "articles#new"

  post "/articles" => "articles#create"

  get "article/:id" => "articles#show"

  patch '/article/:id' => "articles#update"
end
