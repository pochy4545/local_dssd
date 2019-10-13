Rails.application.routes.draw do
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
