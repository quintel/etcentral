ETM::Application.routes.draw do
  REDIRECTS.each_pair do |from, to|
    get from => redirect(to)
  end

  resources :pages,           only: [:index, :show]
  resources :partners,        only: [:index, :show]
  resources :press_releases,  only: [:index, :show]
  resources :articles,        only: [:index, :show], path: '/help/articles'

  get '/404' => 'pages#not_found'

  get '/partners/info/:id' => 'pages#show', as: :partner_info
  get '/contact'           => 'pages#contact'
  post '/send_feedback'    => 'pages#send_feedback'

  # Deprecated references to Pro ETM
  get 'scenarios/:id'  => 'redirects#forward'
  get 'pro'            => 'redirects#forward'
  get 'scenario/*path' => 'redirects#forward'
  get 'scenario'       => 'redirects#forward'
  get 'login'          => 'redirects#forward'

  get ':id' => 'pages#show'

  root :to => 'pages#root'
end
