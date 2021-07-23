# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks do
    resources :items
  end

  devise_for :users
  root 'tasks#index'
end
