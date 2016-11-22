class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def index
    if params[:search] && params[:search] != current_user.email
      @connection_found = User.find_by(email: params[:search])
    end
    @connections = current_user.accepted_connections
  end
end
