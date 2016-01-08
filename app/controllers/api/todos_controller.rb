class Api::TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all.order('created_at DESC')

    render json: @todos
  end

  # GET /todos/1
  def show
    render json: @todo, location: [:api, @todo]
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: [:api, @todo]
    else
      render json: @todo.errors, status: :unprocessable_entity, location: [:api, @todo]
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo, location: [:api, @todo]
    else
      render json: @todo.errors, status: :unprocessable_entity, location: [:api, @todo]
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    head 204
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:title, :completed, :description, :list_id)
    end
end

