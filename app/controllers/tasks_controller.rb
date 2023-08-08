class TasksController < ApplicationController
  
  before_action :authorize_request

  
 
  def create
  @task = Task.new(task_params)
  @task.assigner = @current_user  # Assuming you have a method to get the current user

  if @task.save
    render json: @task, status: :created
  else
    render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
  end
end

def update
  @task = Task.find(params[:id])

  if @task.update(task_params)
    render json: @task, status: :ok
  else
    render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
  end
end


  
  

  def destroy
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.permit(:title, :description, :due_date, :priority,:assignee_id)
  end

  
end

