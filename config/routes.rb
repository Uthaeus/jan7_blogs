Rails.application.routes.draw do
  
  resources :blogs

  root to: 'static#homepage'
end
