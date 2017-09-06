Rails.application.routes.draw do
  root 'games#index'

  get 'game_form', to: 'games#form'

  get '/games/:game_id/render_json', to: 'characters#render_json'

  resources :games do
    resources :characters
  end
end
