class PayoutsController < ApplicationController
  before_action :set_payout, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /payouts
  # GET /payouts.json
  def index
    @payouts = Payout.all
  end

  # GET /payouts/1
  # GET /payouts/1.json
  def show
  end

  # GET /payouts/new
  def new
    @payout = Payout.new
  end

  # GET /payouts/1/edit
  def edit
  end

  # POST /payouts
  # POST /payouts.json
  def create
    @payout = Payout.new(price: current_user.credit, user_id: current_user.id)
    ti_ids = TaskInstance.where('status = ? AND user_id = ?', :finished, current_user.id).select(:id)
    ti_ids.each do |ti|
      ti.update(status: :paid)
    end
    @payout.task_instances = ti_ids

    respond_to do |format|
      if @payout.save
        current_user.update(credit: 0)
        format.html { redirect_to @payout, notice: 'Payout was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payout }
      else
        format.html { render action: 'new' }
        format.json { render json: @payout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payouts/1
  # PATCH/PUT /payouts/1.json
  def update
    respond_to do |format|
      if @payout.update(payout_params)
        format.html { redirect_to @payout, notice: 'Payout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payouts/1
  # DELETE /payouts/1.json
  def destroy
    @payout.destroy
    respond_to do |format|
      format.html { redirect_to payouts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payout
      @payout = Payout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payout_params
      params.require(:payout).permit(:status)
    end
end
