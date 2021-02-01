Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :index]
    delete 'unlike', to: 'likes#destroy'
  end

  
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get  'user_posts', to: 'users#my_posts'
  get  'user_comments', to: 'users#my_comments'
end
