# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new
    @task = current_user.tasks.find(params.require(:task_id))
    @item = @task.items.build
  end

  def edit; end

  def create
    @task = current_user.tasks.find(params.require(:task_id))
    @item = @task.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to task_path(@task), notice: t('notices.on_create', model: Item.name) }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to task_path(@task), notice: t('notices.on_update', model: Item.name) }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to task_path(@item.task), notice: t('notices.on_delete', model: Item.name) }
      format.json { head :no_content }
    end
  end

  private

  def find_item
    @task = current_user.tasks.find(params.require(:task_id))
    @item = @task.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item, :completed)
  end
end
