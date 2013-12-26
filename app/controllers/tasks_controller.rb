class TasksController < ApplicationController
  include TasksHelper
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!#, :except => [:some_action_without_auth]
  skip_load_resource :only => [:create]
  load_and_authorize_resource

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find_by_id(params[:id])   
    @hash = Gmaps4rails.build_markers(@task) do |task, marker|
      marker.lat task.latitude
      marker.lng task.longitude
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    amount = [task_params[:amount].to_i, 1].max #at least one task should be created
    task_instances_content = task_params[:content]
    @task = Task.new(task_params.except!(:amount))
    amount.times do
      @task.task_instances.new(content: task_instances_content, status: :created)
    end

    respond_to do |format|
      if @task.save
        set_task_content()
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params.except!(:amount, :content))
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def show_possible_tasks
    lat = params[:latitude]
    long = params[:longitude]
    respond_to do |format|
      if !Geocoder.address([lat,long]).nil?
        @tasks = nearbary_tasks(lat, long, distance=10)    
        #format.html { redirect_to tasks_url }
        format.json { render json: @tasks }
      else 
        format.html { redirect_to tasks_path }
        format.json { render json: {status: :oooops}, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_task_content
      params[:task_step].each do |quest|
        uploads = quest[:file]
        dir = Rails.root.join('public', 'uploads', @task.id.to_s)
        FileUtils.mkdir_p(dir) unless File.directory?(dir)
        rel_paths = Array.new
        uploads.each do |up|
          File.open(dir.join(up.original_filename), 'wb') do |file|
            file_path = dir.join(up.original_filename).to_s
            public_path = Rails.root.join('public').to_s
            relative_path = file_path.sub(/^#{public_path}\//, '')
            file.write(up.read)
            rel_paths << relative_path
          end
        end
        quest[:file]=rel_paths
        @task.update(content: params[:task_step])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :address, :price, :expirience, :status, :task_type, :content, :exp_require, :amount)
    end
end
