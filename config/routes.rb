Rails.application.routes.draw do
  devise_for :users
  root to: "zines#index"
  resources :zines do
    resources :posts
  end
end