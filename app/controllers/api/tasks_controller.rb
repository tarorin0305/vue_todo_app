class Api::TasksController < ApplicationController

  # GET /tasks
  def index
    @tasks = Task.order("updated_at DESC")
  end

  # POST /tasks
  def create #APIなのでViewファイル表示アクションにあたる new は不要
    @task = Task.new(task_params)

    if @task.save
      render :show, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH or PUT /tasks/:id
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render :show, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

    def task_params
      params.fetch(:task, {}).permit(           #デフォルト値を空ハッシュにしている
                                          :name, :is_done
      )
    end
end