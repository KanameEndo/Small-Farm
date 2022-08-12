Rails.application.routes.draw do
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # , controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end

  resources :foods, expect: [:index] do
    resource :favorites, only: [:create, :destroy]
  end
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'

  resources :plans
  resources :favorites, only: [:create, :destroy]
  root 'foods#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
