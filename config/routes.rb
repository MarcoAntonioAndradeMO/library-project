Rails.application.routes.draw do
  #devise_for :users
  get 'dashboard/index'
  resources :books
  resources :themes
  resources :authors
  resources :employers
  resources :students
  resources :welcome

  resources :books do
    post 'add_theme', on: :member

    member do
      post 'remove_theme/:theme_id', to: 'books#remove_theme', as: :remove_theme
    end
  end




  root to: 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
