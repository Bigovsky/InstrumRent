Rails.application.routes.draw do
  get 'instruments/index'
  get 'instruments/show'
  get 'instruments/new'
  get 'instruments/create'
  get 'instruments/edit'
  get 'instruments/update'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
