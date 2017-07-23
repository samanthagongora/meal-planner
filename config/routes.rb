Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post :day_forms, to: 'day_forms#create'
  put :day_forms, to: 'day_forms#update'

  resources :users, only: [:new, :show, :create] do
    resources :days, only: [:new, :show, :create, :edit, :destroy]
    resources :day_forms, only: [:edit]
  end

  resources :recipes, only: [:index, :new, :create, :show]
end
