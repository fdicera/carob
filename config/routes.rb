Rails.application.routes.draw do
  # Routes for the Challenge run resource:

  # CREATE
  #post("/insert_challenge_run", { :controller => "challenge_runs", :action => "create" })
          
  # READ
  get("/challenge_runs", { :controller => "challenge_runs", :action => "index" })
  
  get("/challenge_runs/:path_id", { :controller => "challenge_runs", :action => "show" })
  
  # UPDATE
  
  #post("/modify_challenge_run/:path_id", { :controller => "challenge_runs", :action => "update" })
  
  # DELETE
  get("/delete_challenge_run/:path_id", { :controller => "challenge_runs", :action => "destroy" })

  #------------------------------

  # Routes for the Challenge type resource:

  # CREATE
  post("/insert_challenge_type", { :controller => "challenge_types", :action => "create" })
          
  # READ
  get("/challenge_types", { :controller => "challenge_types", :action => "index" })
  
  get("/challenge_types/:survey_id", { :controller => "challenge_types", :action => "show" })
  
  # UPDATE
  
  #post("/modify_challenge_type/:path_id", { :controller => "challenge_types", :action => "update" })
  
  # DELETE
  get("/delete_challenge_type/:path_id", { :controller => "challenge_types", :action => "destroy" })

  #------------------------------

  # Routes for the Survey resource:

  # CREATE
  post("/insert_survey", { :controller => "surveys", :action => "create" })
          
  # READ
  get("/surveys", { :controller => "surveys", :action => "index" })
  
  get("/surveys/:path_id", { :controller => "surveys", :action => "show" })
  
  # UPDATE
  
  post("/modify_survey/:path_id", { :controller => "surveys", :action => "update" })
  
  # DELETE
  get("/delete_survey/:path_id", { :controller => "surveys", :action => "destroy" })

  #------------------------------

  # Routes for the Profile resource:

  # CREATE
  post("/insert_profile", { :controller => "profiles", :action => "create" })
          
  # READ
  get("/profiles", { :controller => "profiles", :action => "index" })
  
  get("/profiles/:path_id", { :controller => "profiles", :action => "show" })
  
  # UPDATE
  
  post("/modify_profile/:path_id", { :controller => "profiles", :action => "update" })
  
  # DELETE
  get("/delete_profile/:path_id", { :controller => "profiles", :action => "destroy" })

  #------------------------------

 devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #root "home#show"
  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
