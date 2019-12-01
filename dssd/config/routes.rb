Rails.application.routes.draw do
  get 'routes', to: 'routes#index'
  match 'fechas' => "videoconferencia#fechas", :via => :post
  match 'fechas/iniciarVideoconferencia' => "videoconferencia#iniciarVideoconferencia", :via => :post
  match 'fechas/cancelarVideoconferencia' => "videoconferencia#cancelarVideoconferencia", :via => :post
  match 'fechas/finalizarVideoconferencia' => "videoconferencia#finalizarVideoconferencia", :via => :post
  match 'fechas/avanzarTask' => "videoconferencia#avanzarTask", :via => :post
  match 'fechas/getHoraYfechaDeVideoconferencia' => "videoconferencia#getHoraYfechaDeVideoconferencia", :via => :post
  match 'fechas/confirmarVideoconferencia' => "videoconferencia#confirmarVideoconferencia", :via => :post
  get 'fechas/autenticar', to: "videoconferencia#autenticar"
  get 'fechas/enviarMail', to: "videoconferencia#enviarMail"
  match 'fechas/getInfoDelUsuario' => "videoconferencia#getInfoDelUsuario", :via => :post
  resources :videoconferencia
  resources :unidades
  resources :tipo_videoconferencia
  resources :tipo_participantes
  resources :registro_videoconferencia
  resources :participante_videoconferencia
  resources :interno_unidads
  resources :estado_videoconferencia
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
