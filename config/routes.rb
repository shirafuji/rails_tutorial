Rails.application.routes.draw do
  devise_for :users
  get '/sign_up', to: 'users#new', as: 'sign_up'

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
end
