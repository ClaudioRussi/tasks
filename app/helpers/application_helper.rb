module ApplicationHelper

  def show_notification
    if current_user
      if current_user.received_connection_requests.any?
        link_to "You have new connection requests", requests_list_path
      end
    end
  end
end
