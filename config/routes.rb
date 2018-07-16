Rails.application.routes.draw do

  get 'users/:id/upload', to: 'users#upload_photo', as: 'user_upload_photo'
  devise_for :users
  resources :users
  resources :prints
  resources :authorships
  resources :zines do
    resources :issues do
      resources :articles
    end
  end
  resources :house_memberships
  resources :houses

  root to: "zines#index"

  devise_scope :user do
    get 'logout' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
