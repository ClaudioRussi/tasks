class ConnectionRequestsController < ApplicationController
  before_action :authenticate_user!
  def create
    request = ConnectionRequest.new(user_id: current_user.id, connection_id: params[:user_id], status:'Unconfirmed')
    if request.save
      flash[:notice] = "Connection request sent"
    end
    redirect_to user_path(params[:user_id])
  end

  def accept
    request = ConnectionRequest.find(params[:id])
    request.status = 'Accepted'
    if request.save
      ConnectionRequest.create(connection_id: request.user_id, user_id: current_user.id, status: 'Accepted')
      flash[:notice] = "Connection request accepted"
    end
    redirect_back(fallback_location: root_path)
  end

  def list
    @requests = current_user.received_connection_requests
  end
end
