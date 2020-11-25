class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment this if you want to force users to sign in before any other actions
  before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

  def home
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
    
    @liked_courses = Like.where({ :user_id => the_id })
    
    # @list_of_courses = Course.where({ :id => @liked_courses})

    cruce = Array.new
    
    @liked_courses.each do |a_like|
      cruce.push(a_like.course_id)  
    end

    @liked_courses.each do |a_like|
      @list_of_courses = Course.where({ :id => cruce})
    end

    # @list_of_courses
    render({ :template => "home.html.erb"})
  end

end
