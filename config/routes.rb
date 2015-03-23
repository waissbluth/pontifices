Rails.application.routes.draw do

  get 'pages/home'

  resources :translations do
    get 'random', on: :collection
  end
  root to: 'pages#home'
end
