# == Route Map
#
#                        Prefix Verb   URI Pattern                                                   Controller#Action
#              new_user_session GET    /users/sign_in(.:format)                                      devise/sessions#new
#                  user_session POST   /users/sign_in(.:format)                                      devise/sessions#create
#          destroy_user_session DELETE /users/sign_out(.:format)                                     devise/sessions#destroy
#                 user_password POST   /users/password(.:format)                                     devise/passwords#create
#             new_user_password GET    /users/password/new(.:format)                                 devise/passwords#new
#            edit_user_password GET    /users/password/edit(.:format)                                devise/passwords#edit
#                               PATCH  /users/password(.:format)                                     devise/passwords#update
#                               PUT    /users/password(.:format)                                     devise/passwords#update
#      cancel_user_registration GET    /users/cancel(.:format)                                       devise/registrations#cancel
#             user_registration POST   /users(.:format)                                              devise/registrations#create
#         new_user_registration GET    /users/sign_up(.:format)                                      devise/registrations#new
#        edit_user_registration GET    /users/edit(.:format)                                         devise/registrations#edit
#                               PATCH  /users(.:format)                                              devise/registrations#update
#                               PUT    /users(.:format)                                              devise/registrations#update
#                               DELETE /users(.:format)                                              devise/registrations#destroy
#                          root GET    /                                                             servers#index
#                       servers GET    /servers(.:format)                                            servers#index
#                               POST   /servers(.:format)                                            servers#create
#                    new_server GET    /servers/new(.:format)                                        servers#new
#                   edit_server GET    /servers/:id/edit(.:format)                                   servers#edit
#                        server GET    /servers/:id(.:format)                                        servers#show
#                               PATCH  /servers/:id(.:format)                                        servers#update
#                               PUT    /servers/:id(.:format)                                        servers#update
#                               DELETE /servers/:id(.:format)                                        servers#destroy
#                               GET    /oauth/authorize/:code(.:format)                              doorkeeper/authorizations#show
#           oauth_authorization GET    /oauth/authorize(.:format)                                    doorkeeper/authorizations#new
#                               POST   /oauth/authorize(.:format)                                    doorkeeper/authorizations#create
#                               DELETE /oauth/authorize(.:format)                                    doorkeeper/authorizations#destroy
#                   oauth_token POST   /oauth/token(.:format)                                        doorkeeper/tokens#create
#                  oauth_revoke POST   /oauth/revoke(.:format)                                       doorkeeper/tokens#revoke
#            oauth_applications GET    /oauth/applications(.:format)                                 agent_applications#index
#                               POST   /oauth/applications(.:format)                                 agent_applications#create
#         new_oauth_application GET    /oauth/applications/new(.:format)                             agent_applications#new
#        edit_oauth_application GET    /oauth/applications/:id/edit(.:format)                        agent_applications#edit
#             oauth_application GET    /oauth/applications/:id(.:format)                             agent_applications#show
#                               PATCH  /oauth/applications/:id(.:format)                             agent_applications#update
#                               PUT    /oauth/applications/:id(.:format)                             agent_applications#update
#                               DELETE /oauth/applications/:id(.:format)                             agent_applications#destroy
# oauth_authorized_applications GET    /oauth/authorized_applications(.:format)                      doorkeeper/authorized_applications#index
#  oauth_authorized_application DELETE /oauth/authorized_applications/:id(.:format)                  doorkeeper/authorized_applications#destroy
#              oauth_token_info GET    /oauth/token/info(.:format)                                   doorkeeper/token_info#show
#        apipie_apipie_checksum GET    /api/documentation/apipie_checksum(.:format)                  apipie/apipies#apipie_checksum {:format=>/json/}
#                 apipie_apipie GET    /api/documentation(/:version)(/:resource)(/:method)(.:format) apipie/apipies#index {:version=>/[^\/]+/, :resource=>/[^\/]+/, :method=>/[^\/]+/}
#             api_v1_cpu_usages POST   /api/v1/cpu_usages(.:format)                                  api/v1/cpu_usages#create
#

Rails.application.routes.draw do
  devise_for :users

  root to: 'servers#index'

  resources :servers

  # API Authentication
  use_doorkeeper do
    controllers applications: 'agent_applications'
  end

  # API Documentation
  apipie

  # API
  namespace :api do
    namespace :v1 do
      resources :cpu_usages, only: [:create]
    end
  end
end
