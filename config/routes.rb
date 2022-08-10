Rails.application.routes.draw do
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :foods  # only: [:index, :show]
    # namespace :admin do
    #   resources :foods, only: [:index, :new, :create, :show,  :edit, :destroy]
    # end
  resources :plans
  resources :favorites, only: [:create, :destroy]
  root 'foods#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
