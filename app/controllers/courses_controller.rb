class CoursesController < ApplicationController
  def index
    matching_courses = Course.all

    @list_of_courses = matching_courses.order({ :title => :asc })

    @likes_array = Like.where({ :user_id => session[:user_id]}).map_relation_to_array(:course_id)

    render({ :template => "courses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_courses = Course.where({ :id => the_id })

    @the_course = matching_courses.at(0)

    render({ :template => "courses/show.html.erb" })
  end

  def hot

    matching_courses = Course.all

    @list_of_courses = matching_courses.order({ :likes_count => :desc }).first(10)

    @likes_array = Like.where({ :user_id => session[:user_id]}).map_relation_to_array(:course_id)

    render({ :template => "courses/hot.html.erb" })
  end

  def recommend
    @course_scores = Hash.new

    @user = User.where({ :id => session[:user_id]}).first

          @likes = Like.where({ :user_id => session[:user_id] })
      @likes_array = @likes.map_relation_to_array(:course_id)
        
      cruce = Array.new
        
      @likes.each do |a_like|
        cruce.push(a_like.course_id)  
      end

      @liked_courses = Course.where({ :id => cruce})


    @matching_courses = Course.where.not({ :id => cruce})
    
    @matching_courses.each do |a_course|
      score = 0
      
      #Score for careerpath -> values classes aligned with careerpath
      
      @matching_skillsets = Skillset.where({ :careerpath_id => @user.careerpath_id})
      
      if @matching_skillsets.map_relation_to_array(:course_id).include?a_course.id
        score = score + 2
      else
      end

      #Score for rating -> values classes with high rating by students
      score = score + a_course.rating

      #Score for type of skill -> values classes with the same skill as other liked courses    

      if (@liked_courses != nil and @liked_courses.map_relation_to_array(:skill_id).include?a_course.skill_id)
        score = score + 5
      else
      end

      #Score for type other likes -> values classes like by other similar users

      @similar_users = User.where.not({:id => session[:user_id]}).where({ :careerpath_id => @user.careerpath_id})
 
      @potential_likes = Like.where({ :user_id => @similar_users.map_relation_to_array(:id) })
        
      cross_reference = Array.new
        
      @potential_likes.each do |a_like|
        cross_reference.push(a_like.course_id)  
      end

      @potential_courses = Course.where({ :id => cross_reference})

      if (@potential_courses != nil and @potential_courses.map_relation_to_array(:id).include?a_course.id)
        score = score + 5
      else
      end
      
      #Store scores

      @course_scores.store( a_course.id, score )

    end

    @top = @course_scores.sort_by {|k, v| -v}.first(5)
    @recommended = Array.new

    @top.each do |pair|
      @recommended.push(pair[0])
    end

    @list_of_courses = Course.where({ :id => @recommended})

    render({ :template => "courses/recommend.html.erb" })
  end 

  def create
    the_course = Course.new
    the_course.title = params.fetch("query_title")
    the_course.description = params.fetch("query_description")
    the_course.professor_id = params.fetch("query_professor_id")
    the_course.skill_id = params.fetch("query_skill_id")
    the_course.rating = params.fetch("query_rating")
    the_course.hours_required = params.fetch("query_hours_required")
    the_course.likes_count = params.fetch("query_likes_count")

    if the_course.valid?
      the_course.save
      redirect_to("/courses", { :notice => "Course created successfully." })
    else
      redirect_to("/courses", { :notice => "Course failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_course = Course.where({ :id => the_id }).at(0)

    the_course.title = params.fetch("query_title")
    the_course.description = params.fetch("query_description")
    the_course.professor_id = params.fetch("query_professor_id")
    the_course.skill_id = params.fetch("query_skill_id")
    the_course.rating = params.fetch("query_rating")
    the_course.hours_required = params.fetch("query_hours_required")
    the_course.likes_count = params.fetch("query_likes_count")

    if the_course.valid?
      the_course.save
      redirect_to("/courses/#{the_course.id}", { :notice => "Course updated successfully."} )
    else
      redirect_to("/courses/#{the_course.id}", { :alert => "Course failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_course = Course.where({ :id => the_id }).at(0)

    the_course.destroy

    redirect_to("/courses", { :notice => "Course deleted successfully."} )
  end
end
