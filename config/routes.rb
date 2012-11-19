EtModelCom::Application.routes.draw do
  root to: 'pages#index'

    match '/about'                        => 'pages#about'

end
