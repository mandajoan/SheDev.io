Rails.application.routes.draw do


  root 'sessions#index'
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

#
   get '/users/new' => 'users#new', as: :new_user
   post '/users' => 'users#create'
   get '/users/:id' => 'users#show', as: :user
   get '/users/:id/edit' => 'users#edit', as: :edit_user
   patch '/users/:id' => 'users#update'
   delete '/users/:id' => 'users#destroy'

 #
   get '/comments/new' => 'comments#new', as: :new_comment
   post '/comments' => 'comments#create'
   get '/comments/:id/edit' => 'comments#edit', as: :edit_comment
   patch '/comments/:id' =>'comments#update'
   delete '/comments/:id' => 'comments#destroy'

 #

   get '/posts' => 'posts#index', as: :posts
   get '/posts/new' => 'posts#new', as: :new_post
  get '/posts/:id' => 'posts#show', as: :post
   post '/posts' => 'posts#create'
   get '/posts/:id/edit' => 'posts#edit', as: :edit_post
   patch'/posts/:id' => 'posts#update'
   delete '/posts/:id' => 'posts#destroy'


end
