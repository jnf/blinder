Blinder::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'collect#home'
  # get  'review/:event_id/proposal/:proposal_id' => 'review#detailed', as: :review
  # get  'review/:event_id' => 'review#list', as: :list

  # omniauth provider callback for github auth
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  controller :collect do
    get    ':event_id/new', action: :new, as: :proposals
    post   ':event_id/new', action: :create
    get    'edit/:slug', action: :edit, as: :proposal
    patch  'edit/:id', action: :update
  end

  resources :control, only: [:index, :edit, :update], as: :event
end
