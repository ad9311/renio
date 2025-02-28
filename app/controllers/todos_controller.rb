# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :todo, except: %i[index new create]

  def index
    @todos = current_user.todos
  end

  def show
    @tasks = todo.tasks.order(done: :asc, created_at: :desc)
  end

  def new
    @todo = current_user.todos.new
  end

  def edit; end

  def create
    @todo = current_user.todos.new(todo_params)

    if @todo.save
      redirect_to @todo, notice: 'Todo was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy!

    redirect_to todos_path, notice: 'Todo was successfully destroyed.'
  end

  private

  def todo
    @todo ||= current_user.todos.find(params[:id])
  end

  def todo_params
    params.expect(todo: %i[title categorized])
  end
end
