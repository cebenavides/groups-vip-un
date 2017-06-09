Rails.application.routes.draw do
  resources :pages
  get 'home/index'
  get 'dashboard/users'
  get 'dashboard/approve'

  root to: "home#index"

  devise_for :users, :controllers => { registrations: 'registrations'}
  devise_for :admins

  resources :groups do
    get 'list', on: :member
    resources :publications, except: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
