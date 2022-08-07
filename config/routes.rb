Rails.application.routes.draw do
  get 'plan/index'
  devise_for :users
  resources :foods
  root 'foods#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
