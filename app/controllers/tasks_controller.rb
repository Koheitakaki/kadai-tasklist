class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def create
    @task = Task.new(task_params)
    
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
    @task = Task.new
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
      redirect_to tasks_url
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

end

