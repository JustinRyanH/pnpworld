Rails.application.routes.draw do
  resources :characters
  root to: 'entry#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  # Defines the root path route ("/")
  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end
end
