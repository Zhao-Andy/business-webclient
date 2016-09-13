Rails.application.routes.draw do
  get '/companies' => 'companies#index'
  get '/companies/new' => 'companies#new'
  get '/companies/:id' => 'companies#show'
  get 'companies/:id/edit' => 'companies#edit'
  post '/companies' => 'companies#create'
  patch '/companies/:id' => 'companies#update'
  delete '/companies/:id' => 'companies#destroy'
end
