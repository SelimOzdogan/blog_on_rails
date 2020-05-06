Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"
  # post "post#index"
  # get "/post", to: "post#show"
  # get "/posts/new", to: "posts#new"

  resource :session, only: [:new, :create, :destroy]
  patch "/users/:id/updatepassword" => "users#updatepassword", as: "updatepassword"
  get "/users/:id/editpassword" => "users#editpassword", as: "editpassword"

  # get "/users/:id/editpassword", to: "users#editpassword"
  # post "/users/:id/updatepassword", to: "users#updatepassword"
  resources :users, only: [:new, :create, :edit, :update]

  resources :posts do
    resources :comments, shallow: true, only: [:create, :destroy]
  end
end
