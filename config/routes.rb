Rails.application.routes.draw do  
  root to: "home#index"

  get 'home/index'
  get 'dashboard/users'
  get 'dashboard/approve'
  get 'dashboard/profile'
  
  patch 'admin' => 'dashboard#update'
  put 'admin' => 'dashboard#update'
  post '/tinymce_assets' => 'tinymce_assets#create'  

  devise_for :users, :controllers => { registrations: 'registrations'}
  devise_for :admins

  resources :groups do
    get 'list', on: :member
    get 'visibility', on: :member
    resources :group_images, except: :show
    resources :publications, except: :index do
      get 'visibility', on: :member
    end
    resources :pages, shallow: true do
      get 'visibility', on: :member
    end
  end  
end