Rails.application.routes.draw do
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }
    # get "users/show" => "users#show"
  resources :users, only: [:show, :edit, :update]do
    # resources :favorites, only: [:index]
    get :favorites, on: :collection
  end
  # resources :foods, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
  resources :foods, expect: [:index] do
    resource :favorites, only: [:create, :destroy]
  end
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

    #   resources :foods, only: [:index, :new, :create, :show,  :edit, :destroy]
    # end
  
  resources :plans
  resources :favorites, only: [:create, :destroy]
  root 'foods#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
