Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  get 'home/about' => "homes#about", as: "about"
  resources :books, only:[:new, :index, :show, :edit, :create, :update, :destroy] do
    resources :book_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :users, only:[:index, :show, :edit, :update]
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end