Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :timetables do
    resources :recipes, only: [:new, :create, :edit, :update, :destroy]
  end
  root 'home#index'
end
