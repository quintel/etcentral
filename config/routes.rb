ETM::Application.routes.draw do
  
  match '/prominent_users'              => 'pages#prominent_users'
  match '/press_releases'               => 'pages#press_releases'

  resources :pages, only: [:index, :show]

  resources :partners, only: [:index, :show]

  match '/404'      => 'pages#not_found'

  root :to => 'pages#root'

  match ':id' => 'pages#show'

end
