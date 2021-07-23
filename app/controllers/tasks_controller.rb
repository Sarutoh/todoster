# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.order(created_at: :desc) if user_signed_in?
  end

  def show
    @task = current_user.tasks.find(params.require(:id))
  end

  def edit
    @task = current_user.tasks.find(params.require(:id))
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task = current_user.tasks.find(params.require(:id))
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to root_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = current_user.tasks.find(params.require(:id))
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
