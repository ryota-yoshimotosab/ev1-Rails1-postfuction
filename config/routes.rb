Rails.application.routes.draw do
  
 
  get 'contacts/index'
  get 'contacts/new'
  get 'contacts/edit'
  get 'contacts/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/show'
  devise_for :users
  
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end 
  
  
  get 'destinyarticles/index'
  get 'destinyarticles/new'
  get 'destinyarticles/edit'
  get 'destinyarticles/show'
  root "destinycontent#top"
  get 'destinycontent/top'
  get 'destinycontent/story'
  get 'destinycontent/character'
  
  resources :destinyarticles do 
   resources :records, only: [:create, :destroy]
   resources :likes, only: [:create, :destroy]
   resources :anotherusers, only: [:show]
end 

resources :contacts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
