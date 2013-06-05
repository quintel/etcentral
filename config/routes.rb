ETM::Application.routes.draw do

  resources :pages, only: [:index, :show]

  match '/404'      => 'pages#not_found'

  root :to => 'pages#root'

  match ':id' => 'pages#show'

end
