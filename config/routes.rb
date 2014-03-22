Blinder::Application.routes.draw do
  root 'collect#home'
  get  'review/:event_id/proposal/:proposal_id' => 'review#detailed', as: :review
  get  'review/:event_id' => 'review#list', as: :list

  # omniauth provider callback for github auth
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  controller :collect do
    get    ':event_id/new', action: :new, as: :proposals
    get    'thanks/:slug', action: :thanks, as: :thanks
    get    'edit/:slug', action: :edit, as: :proposal
    post   ':event_id/new', action: :create
    patch  'edit/:id', action: :update
  end

  resources :notes, only: [:create, :update]
  
  namespace :control do
    resources :events, only: [:index, :edit, :update] do
      resources :proposals, only: [:index, :edit, :update, :destroy], param: :proposal_id
    end
  end
end
