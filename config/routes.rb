Rails.application.routes.draw do
  
  get 'home/index'
  get 'dashboard/users'
  get 'dashboard/approve'

  root to: "home#index"

  devise_for :users, :controllers => { registrations: 'registrations'}
  devise_for :admins

  resources :groups do
    get 'list', on: :member
    resources :publications, except: :index
    resources :pages
  end
  
end