Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        post 'publications/search', to: 'publications#search'
        post 'publications/likes', to: 'publications#likes'
        get 'users/:username', to: 'users#show'
        post 'users/photo', to: 'users#photo'
        post 'users/edit/', to: 'users#edit'
        post 'users', to: 'users#set'
        post 'likes/find', to: 'likes#find'
        post 'likes', to: 'likes#create'
        delete 'likes', to: 'likes#delete'
        post 'followers', to: 'relationships#followers'
        post 'following', to: 'relationships#following'
        post 'relationships/find', to: 'relationships#find'
        post 'relationships', to: 'relationships#create'
        delete 'relationships', to: 'relationships#delete'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
