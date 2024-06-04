Rails.application.routes.draw do
  devise_for :users
  resources :timetables do
    resources :recipes, only: [:new, :create, :edit, :update, :destroy]
  end
  root 'timetables#index'
end
