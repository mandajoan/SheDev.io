Rails.application.routes.draw do


  root 'sessions#index'
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout


  resources :users
  resources :posts

  post '/posts/:id/comments' => 'comments#create', as: :post_comments
    get '/users/:user_id/posts/:post_id/comments/:id' => 'comments#show', as: :comment
     get '/users/:user_id/posts/:post_id/comments/new' => 'comments#new', as: :new_comment
     post '/users/:user_id/posts/:post_id/comments' => 'comments#create'
     get '/posts/:post_id/comments/:id/edit' => 'comments#edit', as: :edit_comment
     patch '/users/:user_id/posts/:post_id/comments/:id' =>'comments#update'
     delete '/comments/:id' => 'comments#destroy', as: :delete_comment

     get "/pages/about" => "pages#show", as: :page






end
