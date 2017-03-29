Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :audits
  resource :github_webhooks, only: :create, defaults: { formats: :json }

  root to: "audit#index"

  get "/audit" => "audit#index"
  get ":SourceApplication/show" => "audit#show", as: :messages
  get ":SourceApplication/message/:MessageID/parameters/:MessageType" => "audit#parameters"
end
