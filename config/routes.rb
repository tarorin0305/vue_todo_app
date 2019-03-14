Rails.application.routes.draw do
  root to: "home#index"

  namespace :api, format: "json" do
    resource :tasks, only: [:index, :create, :update]
  end
end
