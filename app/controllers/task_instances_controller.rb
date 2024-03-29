class TaskInstancesController < ApplicationController
  include TaskInstancesHelper
  before_action :set_task_instance, only: [:show, :edit, :update, :destroy, :update_changes_agent, :take, :cancel, :finished, :remaining_time]
  before_filter :free_task_instance?, only: [:take]
  before_filter :my_task_instance?, only: [:cancel]
  before_filter :cancellable?, only: [:cancel]
  before_filter :permited_cahnges?, only: [:update_changes_agent]
  before_filter :time_expired?, only: [:update_changes_agent]
  before_filter :authenticate_user!#, :except => [:some_action_without_auth]
  skip_load_resource :only => [:create]
  load_and_authorize_resource

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
          format.json { render action: 'show', status: :updated, location: @task_instance }
        else
          format.html { render action: 'edit' }
          format.json { render json: @task_instance.errors, status: :unprocessable_entity }
        end
    end
  end

  def update_changes_agent
      @task_instance.status = task_instance_params[:status]
      @task_instance.agent_pos_lat ||= task_instance_params[:agent_pos_lat]
      @task_instance.agent_pos_long ||= task_instance_params[:agent_pos_long]
      params[:task_step].each_with_index do |quest, i|
        if @task_instance.content[i][:type].to_i == 1
          @task_instance.content[i][:given_answer] = update_ti_answer_file(quest[1][:answer])
        else
          @task_instance.content[i][:given_answer] = quest[1][:answer]
        end
      end

      if @task_instance.save
        render action: 'show', status: 200, location: @task_instance
      end
  end

  def take
      @task_instance.status="in_progress"
      @task_instance.user = current_user
      @task_instance.taken_at = Time.now
      if @task_instance.save
          render action: 'show', status: 200, location: @task_instance
      else
          render json: @task_instance.errors, status: :unprocessable_entity
      end
  end

  def cancel
      @task_instance.status="created"
      @task_instance.user = nil
      @task_instance.content = @task_instance.task.content
      @task_instance.comment = ""
      @task_instance.taken_at = nil
      if @task_instance.save
          render action: 'show', status: 200, location: @task_instance
      else
          render json: @task_instance.errors, status: :unprocessable_entity
      end
  end

  def my_tasks
      @task_instances = user_tasks(current_user)
      render json: @task_instances
  end

  def my_statistic
      @statistic = user_statistic(current_user)
      render json: @statistic
  end

  def finished
    if can_set_status('finished') && @task_instance.status != 'finished'
      @task_instance.finish 
      redirect_to @task_instance, notice: 'Task instance was successfully updated.' 
    else
      redirect_to @task_instance, notice: 'Permission error'
    end
  end

  def remaining_time
      render json: @task_instance.time_left
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

    def free_task_instance?
      render json: {status: :allready_taken}, status: 500 if !TaskInstance.find(params[:id]).user.nil?
    end

    def my_task_instance?
      render json: {status: :its_not_yours}, status: 500 if TaskInstance.find(params[:id]).user != current_user
    end

    def cancellable?
      status = TaskInstance.find(params[:id]).status.to_sym
      if status == :finished || status == :paid
        render json: {status: :unpermitted_update}, status: 500
      end
    end

    def permited_cahnges?
      if !(@task_instance.user == current_user && (can_set_status(task_instance_params[:status]) || task_instance_params[:status].nil?))
        render json: {status: :unpermitted_update}, status: 500
      end
    end

    def time_expired?
      if Time.now > @task_instance.taken_at + @task_instance.task.time_to_finish.minute
        render json: { error: 'to late' }, status: 500
      end
    end

    def update_ti_answer_file(file)
      prefix = Pathname.new(Rails.env).join(@task_instance.task.id.to_s, 'answer_file')
      s3 = AWS::S3.new
      file_path = prefix.join(file.original_filename).to_s
      file_url = s3.buckets['checklinestorage1'].objects[file_path].write(file.read).url_for(:read, expires: 1.year.from_now).to_s
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def task_instance_params
      params.require(:task_instance).permit(:status, :content, :comment, :agent_pos_lat, :agent_pos_long)
    end
end
