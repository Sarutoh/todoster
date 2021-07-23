# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy]

  def index
    @items = current_user.items.order(created_at: :desc) if user_signed_in?
  end

  def show; end

  def new
    @item = task.items.build
  end

  def edit; end

  def create
    @item = task.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to task_path(task), notice: 'Item was successfully created.' }
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
        format.html { redirect_to task_path(task), notice: 'Item was successfully updated.' }
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
      format.html { redirect_to task_path(@item.task), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_item
    @item = task.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item, :completed)
  end

  def task
    current_user.tasks.find(params.require(:task_id))
  end
end
