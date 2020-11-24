class CareerpathsController < ApplicationController
  def index
    matching_careerpaths = Careerpath.all

    @list_of_careerpaths = matching_careerpaths.order({ :created_at => :desc })

    render({ :template => "careerpaths/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_careerpaths = Careerpath.where({ :id => the_id })

    @the_careerpath = matching_careerpaths.at(0)

    render({ :template => "careerpaths/show.html.erb" })
  end

  def create
    the_careerpath = Careerpath.new
    the_careerpath.description = params.fetch("query_description")

    if the_careerpath.valid?
      the_careerpath.save
      redirect_to("/careerpaths", { :notice => "Careerpath created successfully." })
    else
      redirect_to("/careerpaths", { :notice => "Careerpath failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_careerpath = Careerpath.where({ :id => the_id }).at(0)

    the_careerpath.description = params.fetch("query_description")

    if the_careerpath.valid?
      the_careerpath.save
      redirect_to("/careerpaths/#{the_careerpath.id}", { :notice => "Careerpath updated successfully."} )
    else
      redirect_to("/careerpaths/#{the_careerpath.id}", { :alert => "Careerpath failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_careerpath = Careerpath.where({ :id => the_id }).at(0)

    the_careerpath.destroy

    redirect_to("/careerpaths", { :notice => "Careerpath deleted successfully."} )
  end
end
