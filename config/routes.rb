ETM::Application.routes.draw do

  # TODO: put in own controller
  match '/press_releases'  => 'pages#press_releases'

  resources :pages,    only: [:index, :show]
  resources :partners, only: [:index, :show]
  resources :presets,  only: [:index, :show]

  match '/404'      => 'pages#not_found'

  root :to => 'pages#root'

  match ':id' => 'pages#show'

end
