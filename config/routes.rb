Rails.application.routes.draw do
  resources :loans
  #devise_for :users
  get 'dashboard/index'
  resources :books
  resources :themes
  resources :authors
  resources :employers
  resources :students
  resources :welcome
  resources :loans

  resources :books do
    post 'add_theme', on: :member

    member do
      post 'remove_theme/:theme_id', to: 'books#remove_theme', as: :remove_theme
      post 'remove_author/:author_id', to: 'books#remove_author', as: :remove_author
    end

    resources :loans, only: [:new, :create]
  end

  resources :employers do
    resources :loans, only: [:new, :create]
  end

  resources :students do
    resources :loans, only: [:new, :create]
  end

  resources :loans do
    member do
      post 'loans/:id/add_book/:book_id', to: 'loans#add_book', as: 'add_book'
    end
  end


  root to: 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
