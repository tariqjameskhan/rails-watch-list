Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root to: :index
  # Defines the root path route ("/")
  root "lists#about"
  # root to :about
  resources :lists, only: [:about, :index, :show, :new, :create] do
    resources :bookmarks, only: [:create]
  end
  resources :bookmarks, only: [:destroy]
end
