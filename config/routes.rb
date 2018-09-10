Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        post 'publications/search', to: 'publications#search'
        get 'users/:username', to: 'users#show'
        post 'users/edit/', to: 'users#update'
        post 'users', to: 'users#set'
        post 'likes/find', to: 'likes#find'
        post 'likes', to: 'likes#create'
        delete 'likes', to: 'likes#delete'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
