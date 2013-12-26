class UsersController < ApplicationController
  before_filter :authenticate_user!
  

  def my_user_data
  	render json: current_user#, only: [:id]
  end
end
