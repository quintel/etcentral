EtModelCom::Application.routes.draw do

  match '/press_release/:id' => 'pages#press_release', as: :press_release
  match '/press_releases' => 'pages#press_releases', key: 'press_releases'

  match '/partners' => 'pages#partners'

  match '/:key/' => 'pages#show', as: :page

  match '/404', to: 'pages#404'
  match '/500', to: 'pages#500'

  root to: 'pages#root'

  match '*_path', to: 'pages#root'

end