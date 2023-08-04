Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'recipes#index', as: :authenticated_root
    end
    unauthenticated do
      root 'public_recipes#index', as: :unauthenticated_root
    end
  end
  
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
  resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
  end
  resources :foods, only: [:index, :new, :create, :show, :destroy] 
  resources :public_recipes, only: [:index]
end