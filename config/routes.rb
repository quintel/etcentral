EtModelCom::Application.routes.draw do

  match '/press_releases' => 'pages#press_releases', key: 'press_releases'
  match '/:key/' => 'pages#show', as: :page

  match '/404', to: 'pages#404'
  match '/500', to: 'pages#500'

  root to: 'pages#root'

end
