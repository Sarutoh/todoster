class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    if user_signed_in?
      @items = current_user.items.order(created_at: :desc)
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @task = current_user.tasks.find(params.require(:task_id))
    @item = @task.items.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @task = current_user.tasks.find(params.require(:task_id))
    @item = @task.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to task_path(@task), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to task_path(@task), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to task_path(@item.task), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def find_item
    @task = current_user.tasks.find(params.require(:task_id))
    @item = @task.items.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:item, :completed)
  end
end
