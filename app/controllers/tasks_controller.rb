class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.order(created_at: :asc)

    # Apply priority filter if provided
    if params[:priority].present?
      @tasks = @tasks.where(priority: params[:priority])
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      render :new
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task was successfully deleted."
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :priority, :status)
  end
end
