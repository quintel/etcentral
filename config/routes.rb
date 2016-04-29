ETM::Application.routes.draw do
  REDIRECTS.each_pair do |from, to|
    match from => redirect(to)
  end

  resources :pages,           only: [:index, :show]
  resources :partners,        only: [:index, :show]
  resources :press_releases,  only: [:index, :show]
  resources :articles,        only: [:index, :show], path: '/help/articles'
  resources :presets,         only: [:index, :show]

  get '/ec', to: redirect('/presets/event/ec2013')
  match 'presets/event/:id' => 'presets#event', as: :event_presets

  match '/404' => 'pages#not_found'

  match '/partners/info/:id' => 'pages#show', as: :partner_info

  # Deprecated references to Pro ETM
  match 'scenarios/:id'  => 'redirects#forward', as: :redirect
  match 'pro'            => 'redirects#forward', as: :redirect
  match 'scenario/*path' => 'redirects#forward', as: :redirect
  match 'scenario'       => 'redirects#forward', as: :redirect
  match 'login'          => 'redirects#forward', as: :redirect

  match ':id' => 'pages#show'

  root :to => 'pages#root'
end
