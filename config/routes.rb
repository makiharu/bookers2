Rails.application.routes.draw do
  root 'homes#top' #サインイン後にルートに飛ばすときは、deviseのヘルパーを使用
  get 'homes/about'
  get 'users' => "users#index"


  devise_for :users

  resources :books
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
