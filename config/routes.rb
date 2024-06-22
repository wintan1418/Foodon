Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/follow'
  get 'users/unfollow'
  get 'home/index'
  devise_for :users
  resources :users, only: [:index, :show] do
    member do
      post 'follow'
      delete 'unfollow'
      get 'profile'
    end
  end
  resources :timetables do
    resources :recipes, only: [:new, :create, :edit, :update, :destroy]
  end
  root 'home#index'
end
