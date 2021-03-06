SubmissionApp::Application.routes.draw do
  get "groups/show"

  get "group/show"

  resource :sessions, :only => [:new, :create, :destroy]

  resources :courses, :only => [:index, :show]
  resources :users, :only => [:show]

  resources :group_types, :only => [:show]

  resources :groups, :only => [:show]

  resources :assignments, :only => [:show] do
    resources :assignment_submissions
  end

  root :to => 'courses#index'
end
