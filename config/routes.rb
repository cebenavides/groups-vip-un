Rails.application.routes.draw do  
  root to: "home#index"

  get 'home/index'
  get 'dashboard/users'
  get 'dashboard/approve'
  get 'dashboard/profile'
  get 'groups/visibility'
  get 'pages/visibility'
  get 'publications/visibility'
  
  patch 'admin' => 'dashboard#update'
  put 'admin' => 'dashboard#update'
  post '/tinymce_assets' => 'tinymce_assets#create'  

  devise_for :users, :controllers => { registrations: 'registrations'}
  devise_for :admins

  resources :groups do
    get 'list', on: :member
    resources :publications, except: :index
    resources :pages, shallow: true
  end  
end