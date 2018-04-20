class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :delete]
  
  def index
    @tasks = Task.all.page(params[:page])
  end
  
  def create
    @task = current_user.tasks.new(task_params)
    
    if 
      @task.save
      flash[:success] = "新規タスクが正常に登録されました"
      redirect_to @task
    
    else
      flash.now[:danger] = "新規タスク登録に失敗しました"
      render :new
    
    end
  end
  
  def new
    @task = current_user.tasks.new
  end
  
  def edit
    set_task
  end
  
  def show
    set_task
  end
  
  def update
    set_task
    
    if @task.update(task_params)
       flash[:success] = "タスクが正常に更新されました"
       redirect_to @task
      
    else
       flash.now[:danger] = "タスクの更新に失敗しました"
       render :edit
    end
  end
  
  def destroy
    set_task
    
    if @task.destroy
      flash[:success] = "タスクは正常に削除されました"
      redirect_to root_url
    end
  end
  
  private
 
  def set_task
    @task = Task.find(params[:id])
  end
 
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
    redirect_to root_url
    end
  end
end

