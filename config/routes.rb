ETM::Application.routes.draw do

  resources :pages,           only: [:index, :show]
  resources :partners,        only: [:index, :show]
  resources :presets,         only: [:index, :show]
  resources :press_releases,  only: [:index, :show]
  resources :articles,        only: [:index, :show]

  match '/404' => 'pages#not_found'

  match '/partners/info/:id' => 'pages#show', as: :partner_info
  
  match '/search' => 'articles#search', :as => :search

  root :to => 'pages#root'

  match ':id' => 'pages#show'

end
