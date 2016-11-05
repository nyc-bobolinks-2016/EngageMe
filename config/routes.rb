Rails.application.routes.draw do
  resources :users do
    resources :presentations do
      get 'run', :on => :member
      post 'snapshot' :on => :member
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'welcome#index'
end
