Rails.application.routes.draw do
  devise_for :users
  resources :prints
  resources :users
  resources :authorships
  resources :zines do
    resources :issues do
      resources :articles
    end
  end
  resources :house_memberships
  resources :houses

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  root to: "zines#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
