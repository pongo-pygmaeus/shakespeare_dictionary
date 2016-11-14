Rails.application.routes.draw do
  resources :words
  get 'welcome/index'

  root 'welcome#index'
  
  resources :works
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
