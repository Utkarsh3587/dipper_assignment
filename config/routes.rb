Rails.application.routes.draw do
  get 'api/request', to: 'dipper#do_request'
  get 'api/serverStatus', to: 'dipper#server_status'
  put 'api/kill', to: 'dipper#kill'
end
