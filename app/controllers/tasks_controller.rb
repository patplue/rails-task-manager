class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def show
    set_task
  end

  def edit
    set_task
  end

  def update
    set_task
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    set_task
    @task.delete
    redirect_to tasks_path
  end

private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
