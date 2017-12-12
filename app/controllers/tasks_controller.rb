class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @date = params[:day_id].to_date
    @tasks = Task.all
  end
  def new
    @task = Task.new
    @date = params[:day_id].to_date
  end
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.date = params[:day_id]
    if @task.save
      redirect_to day_tasks_path(params[:day_id]), success: 'Задание успешно создано'
    else
      redirect_to day_tasks_path(params[:day_id]), danger: 'Задание не создано'
    end
  end
  def destroy
    ActiveTask.where(task_id: params[:day_id]).each do |active|
      active.delete
    end
    Task.find(params[:day_id]).delete
    redirect_to day_tasks_path(params[:id])
  end
  def complete
    if ActiveTask.where(task_id: params[:id], date: params[:day_id]).exists?
      ActiveTask.where(task_id: params[:id], date: params[:day_id]).take.delete
      redirect_to day_tasks_path(params[:day_id])
    else
      ActiveTask.create(task_id: params[:id], date: params[:day_id])
      redirect_to day_tasks_path(params[:day_id])
    end
  end
  private
  def task_params
    params.require(:task).permit(:target, :date, :frequency_id, :user_id, :category_id)
  end
end
