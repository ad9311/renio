# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :todo
  before_action :task, only: %i[show edit update destroy]

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = todo.tasks.build(task_params)

    if @task.save
      redirect_to todo_path(todo), notice: 'Task created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to todo_path(todo), notice: 'Task updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!

    redirect_to todo_path(todo), notice: 'Task deleted successfully'
  end

  private

  def todo
    @todo ||= Todo.find(params[:todo_id])
  end

  def task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.expect(task: %i[title priority done])
  end
end
