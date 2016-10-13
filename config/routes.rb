Rails.application.routes.draw do
  
  resources :zombies do
    resources :tweets
    get :decomp, on: :member
    patch :custom_decomp, on: :member
  end
  resources :roles
  resources :tweets

  get '/tweets' => 'tweets#index'
  root :to => 'tweets#index'
end
