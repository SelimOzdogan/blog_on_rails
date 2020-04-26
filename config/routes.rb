Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "post#index"
  # post "post#index"
  get "/post", to: "post#show"

  # resources :products do
  #   resources :reviews, shallow: true, only: [:create, :destroy]
  # end
end
