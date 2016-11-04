Rails.application.routes.draw do
  resources :users do
    resources :presentations
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/presentations/snapshot' => 'presentations#snapshot'

  root 'users#index'
end
