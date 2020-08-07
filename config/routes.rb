Rails.application.routes.draw do
  resources :follows
  root 'questions#index'
  resources :questions
  resources :answers
  resources :topics
  devise_for :users
  post '/users/:id/follow', to: "follows#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "follows#unfollow", as: "unfollow_user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
