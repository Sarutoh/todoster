class TasksController < ApplicationController
  def index
    if user_signed_in?
      @tasks = current_user.tasks.order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def create
  end

  def update
  end

  def destroy
  end
end
