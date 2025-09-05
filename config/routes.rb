# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    resources :posts, except: [:show]
  end

  resources :posts, only: %i[show index] do
    resources :comments, except: %i[show index]
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show]
      resources :posts, only: %i[index show]
    end
  end

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  post 'contact', to: 'pages#create_contact'
end
