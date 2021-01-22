Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  # get '/cocktails/new', to: 'cocktails#new'
  # get '/cocktails/:id', to: 'cocktails#show'
  # post '/cocktails', to: 'cocktails#create'
  # get '/cocktails/:id/edit', to: 'cocktails#edit'

  resources :cocktails, only: [:index, :show, :new, :create, :edit, :destroy] do
    resources :doses, only: [:create, :new]
  end

  resources :doses, only: [:destroy]
end


