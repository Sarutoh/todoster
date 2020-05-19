Rails.application.routes.draw do
  get 'tasks/index,'
  get 'tasks/show,'
  get 'tasks/create,'
  get 'tasks/update,'
  get 'tasks/destroy'
  devise_for :users
  resources :items
  root 'items#index'
end
