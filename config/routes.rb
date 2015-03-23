Rails.application.routes.draw do

  get 'pages/home'

  resources :translations
  root to: 'pages#home'
end
