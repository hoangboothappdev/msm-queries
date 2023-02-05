class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render({ :template => "directors_templates/index.html.erb"})
  end

  def wisest
    @oldest = Director.where.not({:dob => :nil}).order({:dob => :asc}).at(0)
    render ({ :template => "directors_templates/wisest.html.erb"})
  end

  #rail will prioritize what function is above, so we need to def wisest before we def the dynamic link

  def directors_details
    the_id = params.fetch("an_id")

    @the_director = Director.where({ :id => the_id }).at(0)

    render ({:template => "directors_templates/show.html.erb"})
  end


  
end
