Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end
    resources :lists do
      resources :items
    end
    resources :items
  end

  resources :users do
    resources :lists
  end

  resources :lists, only: [] do
    resources :items, only: [:create, :new]
  end

  resources :items, only: [:destroy]

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
