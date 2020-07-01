Rails.application.routes.draw do
  # get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :index, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :subs, only: [:new, :create, :index, :show, :edit, :update]

  resources :posts, only: [:new, :create, :destroy, :edit, :update]
end
