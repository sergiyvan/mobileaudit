class TaskInstancesController < ApplicationController
  before_action :set_task_instance, only: [:show, :edit, :update, :destroy]

  # GET /task_instances
  # GET /task_instances.json
  def index
    @task_instances = TaskInstance.all
  end

  # GET /task_instances/1
  # GET /task_instances/1.json
  def show
  end

  # GET /task_instances/new
  def new
    @task_instance = TaskInstance.new
  end

  # GET /task_instances/1/edit
  def edit
  end

  # POST /task_instances
  # POST /task_instances.json
  def create
    @task_instance = TaskInstance.new(task_instance_params)

    respond_to do |format|
      if @task_instance.save
        format.html { redirect_to @task_instance, notice: 'Task instance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task_instance }
      else
        format.html { render action: 'new' }
        format.json { render json: @task_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_instances/1
  # PATCH/PUT /task_instances/1.json
  def update
    respond_to do |format|
      if @task_instance.update(task_instance_params)
        format.html { redirect_to @task_instance, notice: 'Task instance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_instances/1
  # DELETE /task_instances/1.json
  def destroy
    @task_instance.destroy
    respond_to do |format|
      format.html { redirect_to task_instances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_instance
      @task_instance = TaskInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_instance_params
      params[:task_instance]
    end
end
