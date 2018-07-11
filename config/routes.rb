Rails.application.routes.draw do
  resources :letters
  devise_for :users,
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
end
