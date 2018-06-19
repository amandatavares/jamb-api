Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
  root 'authentications#signin'

  # These routes will be for signup. The first renders a form in the browse, the second will 
  # receive the form and create a user in our database using the data given to us by the user.

  # resources :authentications
  # post '/login'
  post 'login', to: 'authentications#signin' #ao acessar endereco/login vai tentar autenticar
end
