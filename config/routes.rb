Rails.application.routes.draw do
  
  resources :zombies do
    resources :tweets
    get :decomp, on: :member
    patch :custom_decomp, on: :member
  end
  resources :roles

  get '/tweets' => 'tweets#index'
end
