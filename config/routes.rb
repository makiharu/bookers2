Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  get 'users' => "users#index"


  devise_for :users

  resources :books
  resources :users, only: [:create, :index, :show, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
