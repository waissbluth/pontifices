Rails.application.routes.draw do

  devise_for :users

  resources :translations do
    get 'random', on: :collection
  end
  root to: 'pages#home'
end
