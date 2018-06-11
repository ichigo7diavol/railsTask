class ProjectsController < ApplicationController
  def index
    @Projects = Project.all
  end

  def update
    Todo[params[:id]].update_attributes(:isCompleted => params[:isCompleted])
  end

  def create
    # logger.tagged("BCX") {  }
    logger.tagged("BCX") { logger.info params }
    
    @project = Project.all.find( params[:todo][:project_id] )
    @todo = @project.todos.new text: params[:todo][:text]
    @project.todos << @todo
    if @project.save
      redirect_back fallback_location: '/'
    end
    # .new( text:params[:text], isCompleted:params[:isCompleted] )
    #Project[params[:id]] << @todo
  end
end
