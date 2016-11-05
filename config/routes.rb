Rails.application.routes.draw do

  resources :users do
    resources :presentations
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'welcome#index'
end
