Rails.application.routes.draw do

 

  devise_for :users , controllers: { confirmations: 'confirmations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 namespace :v1, :defaults => {:format => :json} do

#name space for feeds
  namespace :feeds do
     get "/dark-web/compromised-accounts" => "compromised_accounts#index"
     get "/dark-web/compromised-accounts/:id" => "compromised_accounts#show"

     get "/dark-web/compromised-services/" => "compromised_services#index"
     get "/dark-web/compromised-services/:id" => "compromised_services#show"

     get "/reviews" => "reviews#index"
     get "/reviews/:id" => "reviews#show"
  

  end

    devise_for :users 

    as :user do
    #users/auth endpoint user 
      match   "/users/auth"       => "sessions#create" , :via => :post
      #post "/users"        =>        "users#create"
      get   "/users"       => "sessions#users"
      delete "/sign-out"      => "sessions#destroy"
      get "/users/current" => "sessions#current"
      post "/users/current" => "registrations#update"
    end
    

  end


  get 'static_pages/home'
  get 'static_pages/help'
  root to: "static_pages#home"


  
end
