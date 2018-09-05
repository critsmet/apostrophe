Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        get 'publications', to: 'publications#index'
        post 'publications/search', to: 'publications#search'
        post 'users', to: 'users#set'
      end
    end
    resources :likes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
