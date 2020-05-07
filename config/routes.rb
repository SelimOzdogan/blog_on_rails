Rails.application.routes.draw do
  get "/users/users_info" => "users#users_info"


  root "posts#index"

  resource :session, only: [:new, :create, :destroy]
  patch "/users/:id/updatepassword" => "users#updatepassword", as: "updatepassword"
  get "/users/:id/editpassword" => "users#editpassword", as: "editpassword"

  resources :users, only: [:new, :create, :edit, :update]

  resources :posts do
    resources :comments, shallow: true, only: [:create, :destroy]
  end
end
