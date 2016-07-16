Rails.application.routes.draw do
  resources :categories, except: [:show]
  resources :genders, except: [:show]
  resources :titles, except: [:show]
  resources :colonies, except: [:show]
  resources :cities, except: [:show]
  resources :states, except: [:show]
  resources :entries, except: [:show]
  resources :permissions
  resources :areas, except: [:show]
  resources :roles
  devise_for :users,
             controllers: {sessions: 'users/sessions',
                           confirmations: 'users/confirmations',
                           unlocks: 'users/unlocks',
                           registrations: 'users/registrations',
                           passwords: 'users/passwords',
                           password_expired: 'users/password_expired'},
             path: '/',
             path_names: {sign_in: 'login',
                          sign_out: 'logout'}

  devise_scope :user do
    # Redirect to the authenticated path if the user is authenticated.
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    # Redirect to the unauthenticated path if the user is unauthenticated.
    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end

    authenticate :user do
      # List all users.
      get '/users', to: 'users/registrations#index', as: :user_registrations

      # Allows to create an user
      get '/users/new', to: 'users/registrations#new', as: :new_user_registration
      post '/users', to: 'users/registrations#create', as: :create_user_registration

      # Allows to edit our own profile
      get '/users/edit', to: 'users/registrations#edit', as: :edit_profile
      match '/users', to: 'users/registrations#update', as: :update_profile, via: [:patch, :put]

      # Allows to edit the profile of an user.
      get '/users/:id/edit', to: 'users/registrations#edit_user', as: :edit_user_registration
      match '/users/:id', to: 'users/registrations#update_user', as: :update_user_registration, via: [:patch, :put]

      # Allows to modify our own password.
      get '/users/change_password', to: 'users/registrations#change_password', as: :change_password
      match '/save_password', to: 'users/registrations#save_password', as: :save_password, via: [:patch, :put]

      # Allows to edit the passwords of other users.
      get '/users/:id/change_password', to: 'users/registrations#change_user_password', as: :change_user_password
      match '/save_password/:id', to: 'users/registrations#save_user_password', as: :save_user_password,
            via: [:patch, :put]

      # Displays the information of a user.
      get '/users/:id', to: 'users/registrations#show', as: :user_registration

      # Allows to delete a user.
      delete '/users/:id', to: 'users/registrations#destroy', as: :destroy_user_registration

      # Routes for the different types of requests
      get '/requests/new/project', to: 'requests#new_project', as: :new_project
      get '/requests/new/complaint', to: 'requests#new_complaint', as: :new_complaint
      get '/requests/new/audience', to: 'requests#new_audience', as: :new_audience
      get '/requests/new/resume', to: 'requests#new_resume', as: :new_resume
      get '/requests/new/management', to: 'requests#new_management', as: :new_management

      get '/project_requests', to: 'requests#index_projects', as: :index_projects
      get '/project_complaints', to: 'requests#index_complaints', as: :index_complaints
      get '/project_audiences', to: 'requests#index_audiences', as: :index_audiences
      get '/project_resumes', to: 'requests#index_resumes', as: :index_resumes
      get '/project_managements', to: 'requests#index_managements', as: :index_managements

      resources :requests, except: [:new]
    end

    # Allows the execution of the back button in the login options.
    get '/login', to: 'devise/seasons#new'
  end


  post '/application/importation', to: 'application#importation', as: :importation

  # Get a list of actions that a controller has.
  get '/permissions/new/get_controller_actions', to: 'permissions#get_controller_actions', as: :get_controller_actions

  # Generate the seeds of the permissions and its relations with roles
  post '/permissions/generate_seeds', to: 'permissions#generate_seeds', as: :generate_seeds

  # Displays the selected rol with his permissions
  get '/roles/:role_id/permissions', to: 'roles#role_permissions', as: :role_permissions

  # Makes the relations of a role with the permissions.
  post '/roles/:role_id/assign_permissions', to: 'roles#assign_permissions', as: :assign_permissions
end
