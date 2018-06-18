class ProjectsController < ApplicationController
  def index
    respond_to :html, :json
    @Projects = Project.all
    respond_to do |format|
      format.html # index.html.erb
      format.json {
        render :json => @Projects, :include => [:todos]
       }
     end
  end

  def update
    @todo = Project.all.find(params[:todo][:pr_id]).todos.all.find(params[:todo][:id])
    @todo.update_attribute(:isCompleted, params[:isCompleted] ) if @todo

    redirect_back fallback_location: '/'
  end

  def create

    if params[:todo][:project_id] == "" and
      redirect_back fallback_location: '/'
      return;
    end

    @project = Project.all.find( params[:todo][:project_id])
    @todo = @project.todos.new text: params[:todo][:text]
    @project.todos << @todo

    if @project.save
      redirect_back fallback_location: '/'
    end
  end
end
