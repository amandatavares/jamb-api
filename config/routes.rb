Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
  root 'authentications#sign_in'
  # resources :authentications

end
