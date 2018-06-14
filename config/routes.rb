Rails.application.routes.draw do

  resources :projects

  root 'projects#index'
  put '/projects/:id', to: 'projects#update', as: 'update_project'

  root 'projects#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  # for rename test
end
