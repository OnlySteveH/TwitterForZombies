Rails.application.routes.draw do
  
  resources :zombies do
    resources :tweets
  end
  resources :roles

  get '/tweets' => 'tweets#index'
end
