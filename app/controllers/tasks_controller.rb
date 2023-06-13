class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = scope(Task)
  end

  def show
    authorize @task
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize @task
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @task
  end

  def update
    authorize @task
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    authorize @task
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permt(:user_id, :job_id, :category, :status, :deadline, :description, :name)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end
