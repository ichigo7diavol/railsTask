Rails.application.routes.draw do

  resources :projects
  #POST  'projectsssssssssss#create'

  root 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  # for rename test
end
