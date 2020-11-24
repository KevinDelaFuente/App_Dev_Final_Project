class CreditsController < ApplicationController
  def index
    matching_credits = Credit.all

    @list_of_credits = matching_credits.order({ :created_at => :desc })

    render({ :template => "credits/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_credits = Credit.where({ :id => the_id })

    @the_credit = matching_credits.at(0)

    render({ :template => "credits/show.html.erb" })
  end

  def create
    the_credit = Credit.new
    the_credit.user_id = params.fetch("query_user_id")
    the_credit.course_id = params.fetch("query_course_id")

    if the_credit.valid?
      the_credit.save
      redirect_to("/credits", { :notice => "Credit created successfully." })
    else
      redirect_to("/credits", { :notice => "Credit failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_credit = Credit.where({ :id => the_id }).at(0)

    the_credit.user_id = params.fetch("query_user_id")
    the_credit.course_id = params.fetch("query_course_id")

    if the_credit.valid?
      the_credit.save
      redirect_to("/credits/#{the_credit.id}", { :notice => "Credit updated successfully."} )
    else
      redirect_to("/credits/#{the_credit.id}", { :alert => "Credit failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_credit = Credit.where({ :id => the_id }).at(0)

    the_credit.destroy

    redirect_to("/credits", { :notice => "Credit deleted successfully."} )
  end
end
