ETM::Application.routes.draw do

  # Temporary: Redirect RLI scenarios to beta scenarios
  match '/ser-scenario-2023'                    => redirect { 'http://beta.pro.et-model.com/scenarios/193349' }
  match '/80-procent-co2-reductiescenario-2050' => redirect { 'http://beta.pro.et-model.com/scenarios/423879' }
  match '/95-procent-co2-reductiescenario-2050' => redirect { 'http://beta.pro.et-model.com/scenarios/423882' }

  # match '/help' => 'articles#index', as: :help

  resources :pages,           only: [:index, :show]
  resources :partners,        only: [:index, :show]
  resources :press_releases,  only: [:index, :show]
  resources :articles,        only: [:index, :show], path: '/help/articles'

  get '/ec', to: redirect('/presets/event/ec2013')
  match 'presets/event/:id' => 'presets#event', as: :event_presets
  resources :presets,         only: [:index, :show]

  match '/404' => 'pages#not_found'

  match '/partners/info/:id' => 'pages#show', as: :partner_info

  # match '/help/search' => 'articles#search', as: :search

  # Deprecated references to Pro ETM
  match 'scenarios/:id'  => 'redirects#forward', as: :redirect
  match 'pro'            => 'redirects#forward', as: :redirect
  match 'scenario/*path' => 'redirects#forward', as: :redirect
  match 'scenario'       => 'redirects#forward', as: :redirect
  match 'login'          => 'redirects#forward', as: :redirect

  match ':id' => 'pages#show'

  root :to => 'pages#root'

end
