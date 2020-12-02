Rails.application.routes.draw do

  # Routes for the Professor resource:

  # CREATE
  post("/insert_professor", { :controller => "professors", :action => "create" })
          
  # READ
  get("/professors", { :controller => "professors", :action => "index" })
  
  get("/professors/:path_id", { :controller => "professors", :action => "show" })
  
  # UPDATE
  
  post("/modify_professor/:path_id", { :controller => "professors", :action => "update" })
  
  # DELETE
  get("/delete_professor/:path_id", { :controller => "professors", :action => "destroy" })

  #------------------------------

  get("/", { :controller => 'application', :action => 'home'})

  # Routes for the Credit resource:

  # CREATE
  post("/insert_credit", { :controller => "credits", :action => "create" })
          
  # READ
  get("/credits", { :controller => "credits", :action => "index" })
  
  get("/credits/:path_id", { :controller => "credits", :action => "show" })
  
  # UPDATE
  
  post("/modify_credit/:path_id", { :controller => "credits", :action => "update" })
  
  # DELETE
  get("/delete_credit/:path_id", { :controller => "credits", :action => "destroy" })

  #------------------------------

  # Routes for the Skillset resource:

  # CREATE
  post("/insert_skillset", { :controller => "skillsets", :action => "create" })
          
  # READ
  get("/skillsets", { :controller => "skillsets", :action => "index" })
  
  get("/skillsets/:path_id", { :controller => "skillsets", :action => "show" })
  
  # UPDATE
  
  post("/modify_skillset/:path_id", { :controller => "skillsets", :action => "update" })
  
  # DELETE
  get("/delete_skillset/:path_id", { :controller => "skillsets", :action => "destroy" })

  #------------------------------

  # Routes for the Skill resource:

  # CREATE
  post("/insert_skill", { :controller => "skills", :action => "create" })
          
  # READ
  get("/skills", { :controller => "skills", :action => "index" })
  
  get("/skills/:path_id", { :controller => "skills", :action => "show" })
  
  # UPDATE
  
  post("/modify_skill/:path_id", { :controller => "skills", :action => "update" })
  
  # DELETE
  get("/delete_skill/:path_id", { :controller => "skills", :action => "destroy" })

  #------------------------------

  # Routes for the Careerpath resource:

  # CREATE
  post("/insert_careerpath", { :controller => "careerpaths", :action => "create" })
          
  # READ
  get("/careerpaths", { :controller => "careerpaths", :action => "index" })
  
  get("/careerpaths/:path_id", { :controller => "careerpaths", :action => "show" })
  
  # UPDATE
  
  post("/modify_careerpath/:path_id", { :controller => "careerpaths", :action => "update" })
  
  # DELETE
  get("/delete_careerpath/:path_id", { :controller => "careerpaths", :action => "destroy" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Course resource:

  get("/courses/hot", { :controller => "courses", :action => "hot" })

  get("/courses/recommend", { :controller => "courses", :action => "recommend" })

  # CREATE
  post("/insert_course", { :controller => "courses", :action => "create" })
          
  # READ
  get("/courses", { :controller => "courses", :action => "index" })
  
  get("/courses/:path_id", { :controller => "courses", :action => "show" })
  
  # UPDATE
  
  post("/modify_course/:path_id", { :controller => "courses", :action => "update" })
  
  # DELETE
  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  #------------------------------

end
