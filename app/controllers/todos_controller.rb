class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  # GET /todos or /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)
  
    respond_to do |format|
      if @todo.save
        flash[:notice] = "Todoが作成されました。"
        format.html { redirect_to @todo }
        format.json { render :show, status: :created, location: @todo }
      else
        flash[:alert] = "Todoの作成に失敗しました。"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        flash[:notice] = "Todoが更新されました。"
        format.html { redirect_to @todo }
        format.json { render :show, status: :ok, location: @todo }
      else
        flash[:alert] = "Todoの更新に失敗しました。"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    if @todo.destroy
      flash[:notice] = "Todoが削除されました。"
    else
      flash[:alert] = "Todoの削除に失敗しました。"
    end
  
    respond_to do |format|
      format.html { redirect_to todos_path, status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :description, :start_time, :end_time)
    end
end
