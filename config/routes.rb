EtModelCom::Application.routes.draw do
  root to: 'pages#index'

    match '/about'                         => 'pages#about'
    match '/disclaimer'                   => 'pages#disclaimer'
    match '/privacy_statement'        => 'pages#privacy_statement'
    match '/press_releases'             => 'pages#press_releases'
    match "/404", :to => "pages#404"

end
