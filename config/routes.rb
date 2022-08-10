Rails.application.routes.draw do
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show]do
    resources :favorites, only: [:index]
  end
  resources :foods, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    #   resources :foods, only: [:index, :new, :create, :show,  :edit, :destroy]
    # end
  resources :plans
  resources :favorites, only: [:create, :destroy]
  root 'foods#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
