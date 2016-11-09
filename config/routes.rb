Rails.application.routes.draw do
  resources :users do
    get 'welcome', :on => :member
    resources :presentations do
      get 'run', :on => :member
      post 'snapshot', :on => :member
    end
    resources :presentation, only: :update
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'home#index'
end
