Rails.application.routes.draw do

  get 'users/index'


  get 'profile/:id', to:'users#show', as: 'user'
  get 'users', to:'users#index', as: 'users'

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    post 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :projects do
    resources :groups, only:[:new, :create]
  end

  resources :groups, except:[:new, :index, :create] do
    resources :tasks, only:[:new, :create]
  end

  resources :tasks, except:[:new, :index, :create]
  patch 'change_status/:id', to: 'tasks#change_status', as: 'change_status'


  patch 'add_worker/:id', to:'tasks#add_worker', as: 'add_worker'
  patch 'add_collaborator/:id', to: 'projects#add_collaborator', as: 'add_collaborator'

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  post 'request/send/:user_id', to: 'connection_requests#create', as: 'send_request'
  post 'request/accept/:id', to: 'connection_requests#accept', as: 'accept_request'
  get 'requests/list', to: 'connection_requests#list', as: 'requests_list'

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
