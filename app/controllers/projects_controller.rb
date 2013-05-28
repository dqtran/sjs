class ProjectsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :show, :new, :update, :destroy]
  before_filter :correct_user, only: :destroy

  def new
    @project = current_user.projects.build if signed_in?
    @comments = current_user.comments.paginate(page: params[:page])
    render 'new'
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:success] = "Project created!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end  

  def show
    @project=Project.find(params[:id])
    @comments = current_user.comments.paginate(page: params[:page])
    render 'show'
  end

  def edit
  end

  def update
  end

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def destroy
    @project.destroy
    redirect_back_or root_path
  end

  private

    def correct_user
      @project = current_user.projects.find_by_id(params[:id])
      redirect_to root_path if @project.nil?
    end
end
