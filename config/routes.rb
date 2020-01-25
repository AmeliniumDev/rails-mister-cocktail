Rails.application.routes.draw do
  # get 'doses/index'
  # get 'doses/new'
  # get 'doses/create'
  # get 'doses/destroy'
  # get 'cocktails/index'
  # get 'cocktails/show'
  # get 'cocktails/new'
  # get 'cocktails/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # A user can see the list of cocktails
  # GET "cocktails"
  # A user can see the details of a given cocktail, with the dose needed for each ingredient
  # GET "cocktails/42"
  # A user can create a new cocktail
  # GET "cocktails/new"
  # POST "cocktails"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
