class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit, :update]
  # before_action :set_task, only: [:show, :edit, :update]
    
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクを投稿しました。'
      redirect_to root_url
    else
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'タスクの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def show
    set_task
  end
  
  def edit
    set_task
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

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
  
  
#  def index
#    @tasks = Task.all.page(params[:page]).per(10)
#  end
#  
#  def show
#    set_task
#  end
#  
#  def new
#    @task = Task.new
#  end
  
#  def create
#    @task = Task.new(task_params)
    
#    if @task.save
#      flash[:success] = 'タスクが正常に投稿されました'
#      redirect_to @task
      
#    else
#      flash.now[:danger] = 'タスクが投稿されませんでした'
#      render :new
#    end
#  end
  
#  def edit
#    set_task
#  end

#  def update
#    @task = Task.find(params[:id])
    
#    if @task.update(task_params)
#      flash[:success] = 'タスクが正常に更新されました'
#      redirect_to @task
      
#    else
#      flash.now[:danger] = 'タスクは更新されませんでした'
#      render :new
#    end
#  end

#  def destroy
#    set_task
#    @task.destroy
    
#    flash[:success] = 'タスクは正常に削除されました'
#    redirect_to tasks_url
#  end
  
#  private
  
#  def set_task
#    @task = Task.find(params[:id])
#  end
  
#  #strong parameter
#  def task_params
#    params.require(:task).permit(:content, :status)
#  end