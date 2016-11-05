Rails.application.routes.draw do
  resources :users do
    resources :presentations do
      get 'run', :on => :member
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/presentations/snapshot' => 'presentations#snapshot'

  root 'welcome#index'
end
