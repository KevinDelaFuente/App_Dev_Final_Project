class SkillsetsController < ApplicationController
  def index
    matching_skillsets = Skillset.all

    @list_of_skillsets = matching_skillsets.order({ :created_at => :desc })

    render({ :template => "skillsets/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_skillsets = Skillset.where({ :id => the_id })

    @the_skillset = matching_skillsets.at(0)

    render({ :template => "skillsets/show.html.erb" })
  end

  def create
    the_skillset = Skillset.new
    the_skillset.skill_id = params.fetch("query_skill_id")
    the_skillset.careerpath_id = params.fetch("query_careerpath_id")

    if the_skillset.valid?
      the_skillset.save
      redirect_to("/skillsets", { :notice => "Skillset created successfully." })
    else
      redirect_to("/skillsets", { :notice => "Skillset failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_skillset = Skillset.where({ :id => the_id }).at(0)

    the_skillset.skill_id = params.fetch("query_skill_id")
    the_skillset.careerpath_id = params.fetch("query_careerpath_id")

    if the_skillset.valid?
      the_skillset.save
      redirect_to("/skillsets/#{the_skillset.id}", { :notice => "Skillset updated successfully."} )
    else
      redirect_to("/skillsets/#{the_skillset.id}", { :alert => "Skillset failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_skillset = Skillset.where({ :id => the_id }).at(0)

    the_skillset.destroy

    redirect_to("/skillsets", { :notice => "Skillset deleted successfully."} )
  end
end
