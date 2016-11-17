module TasksHelper
  def is_working_on_task?(task)
    if task.workers.include?(current_user)
      true
    else
      false
    end
  end
end
