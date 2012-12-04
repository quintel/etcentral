EtModelCom::Application.routes.draw do

  resources :press_releases, only: [:index, :show]
  
  match "partners/" => 'partners#index'

  match '/:key/' => 'pages#show', as: :page

  match '/404', to: 'pages#404'
  match '/500', to: 'pages#500'

  root to: 'pages#root'


end