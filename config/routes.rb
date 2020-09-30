Rails.application.routes.draw do
  devise_for :users
  get 'posts/top'
  root to: "posts#top"
  resources :posts, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
    resource :likes, only: [:create, :destroy] do
      resources :users, only: [:show]
    end
    resources :messages, only: [:create]
  end
end
