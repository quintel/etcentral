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

  root :to => 'pages#root'

  match ':id' => 'pages#show'

end
