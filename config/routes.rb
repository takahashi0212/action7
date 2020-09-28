Rails.application.routes.draw do
  devise_for :users
  get 'posts/top'
  root to: "posts#top"
  resources :posts, only: [:index, :new, :create, :show] do
    resource :likes, only: [:create, :destroy]
  end
end
