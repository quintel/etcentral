EtModelCom::Application.routes.draw do
  root to: 'pages#index'

    match '/about'                        => 'pages#about'
    match '/disclaimer'                   => 'pages#disclaimer'

end
