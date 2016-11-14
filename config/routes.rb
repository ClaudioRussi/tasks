Rails.application.routes.draw do

  get 'profile/:id', to:'users#show', as: 'user'


  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    post 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :projects do
    resources :groups do
      resources :tasks
    end
  end
  get 'task/:id', to: 'tasks#show', as: 'task'
  patch 'add_worker/:id', to:'tasks#add_worker', as: 'add_worker'
  get 'groups/:id', to: 'groups#show', as: 'group'
  patch 'add_collaborator/:id', to: 'projects#add_collaborator', as: 'add_collaborator'

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  post 'request/send/:user_id', to: 'connection_requests#create', as: 'send_request'
  post 'request/accept/:id', to: 'connection_requests#accept', as: 'accept_request'
  get 'requests/list', to: 'connection_requests#list', as: 'requests_list'

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
