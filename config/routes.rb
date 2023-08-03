# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'logout', to: 'session#destroy', as: :logout
  end

  root 'users#index'

  resources :recipes, only: %i[index new create show destroy] do
    resources :recipe_foods, only: %i[new create destroy update edit]
  end

  resources :foods, only: %i[index new create show destroy]

  resources :public_recipes, only: [:index]
end
