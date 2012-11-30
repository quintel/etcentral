EtModelCom::Application.routes.draw do

  match '/press_releases' => 'press_releases#index'
  match '/press_release/:id' => 'press_releases#show', as: :press_release
  
  match "partners/" => 'partners#index'

  match '/:key/' => 'pages#show', as: :page

  match '/404', to: 'pages#404'
  match '/500', to: 'pages#500'

  root to: 'pages#root'

  #match '*_path', to: 'pages#root'

end