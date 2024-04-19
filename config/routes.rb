Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :bookmarks, only: [:create, :destroy]
  end
  resources :categories do
    get :children, on: :member
  end

  namespace :admin do
    resources :members, only: [:index, :create, :destroy]
  end
end
