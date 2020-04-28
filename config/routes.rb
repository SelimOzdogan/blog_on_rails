Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"
  # post "post#index"
  # get "/post", to: "post#show"
  # get "/posts/new", to: "posts#new"

  resources :posts do
    resources :comments, shallow: true, only: [:create, :destroy]
  end
end
