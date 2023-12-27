Rails.application.routes.draw do
  root 'chats#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :chats, only: %i[show create], param: :title
  resources :messages, only: :create

  namespace :api do
    namespace :v1 do
      resources :chats, only: [:index]
      resources :messages, only: [:create]
    end
  end
end
