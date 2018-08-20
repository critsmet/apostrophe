Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :publications
      end
    end
    resources :users
    resources :likes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
