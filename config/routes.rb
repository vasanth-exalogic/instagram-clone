Rails.application.routes.draw do
  resources :posts
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '/users/sign_out' => 'home#temp'
  get '/:id' => 'home#show', as: 'profile'
  get '/:id/edit' => 'home#edit', as: 'edit_profile'
  patch '/update/profile' => 'home#update', as: 'update_profile'
  get '/follow/:id' => 'followers#new', as: 'new_follow'
  get '/follow/:id/delete' => 'followers#destroy', as: 'destroy_follow'

  get '/like/:id' => 'likes#new', as: 'like'
  get '/unlike/:id' => 'likes#destroy', as: 'unlike'

  post '/comment/:id' => 'lists#create', as: 'new_comment'
end
