Blinder::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'collect#home'
  get  'review/:id' => 'review#detailed', as: :review
  get  'review' => 'review#list', as: :list

  controller :collect do
    get  ':event_id/new', action: :new, as: :proposals
    post ':event_id/new', action: :create
    get  'edit/:slug', action: :edit, as: :proposal
    patch  'edit/:id', action: :update
  end

  controller :control do
    get  'events', as: :events
    get  'config/:event_id', action: :config, as: :config
    post 'config/:event_id', action: :update
  end
end
