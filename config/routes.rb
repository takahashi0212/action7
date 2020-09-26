Rails.application.routes.draw do
  devise_for :users
  get 'posts/top'
  root to: "posts#top"
  resources :posts, only: [:index, :new, :create, :show]
end
