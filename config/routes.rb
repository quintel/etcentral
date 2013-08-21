ETM::Application.routes.draw do

  match '/help' => 'articles#index', as: :help

  resources :pages,           only: [:index, :show]
  resources :partners,        only: [:index, :show]
  resources :presets,         only: [:index, :show]
  resources :press_releases,  only: [:index, :show]
  resources :articles,        only: [:index, :show], path: '/help/articles'

  match '/404' => 'pages#not_found'

  match '/partners/info/:id' => 'pages#show', as: :partner_info

  match '/help/search' => 'articles#search', as: :search

  # Deprecated references to Pro ETM
  match 'scenarios/:id'  => 'redirects#forward', as: :redirect
  match 'pro'            => 'redirects#forward', as: :redirect
  match 'scenario/*path' => 'redirects#forward', as: :redirect
  match 'scenario'       => 'redirects#forward', as: :redirect
  match 'login'          => 'redirects#forward', as: :redirect

  match ':id' => 'pages#show'

  root :to => 'pages#root'

end
