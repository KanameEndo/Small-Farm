Rails.application.routes.draw do
  get 'maps/index'
  get 'users/show'
  devise_for :users, controllers: { registrations: 'users/registrations',passwords: 'users/passwords'}
  # 以下を追加
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_sign_in', to: 'users/sessions#admin_sign_in'
  end
  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end

  resources :foods do
    resource :favorites, only: [:create, :destroy]
  end
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'

  resources :plans
  resources :favorites, only: [:favorites, :create, :destroy]
  root 'foods#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :contacts, only: [:index, :create, :done]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  post 'contacts/done', to: 'contacts#done', as: 'done'
  # get 'done', to: 'contacts#done', as: 'done'

  resources :maps, only: [:index]
end
