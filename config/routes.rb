# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'logout', to: 'session#destroy', as: :logout
  end
  # Defines the root path route ("/")
  root 'users#index'
end
