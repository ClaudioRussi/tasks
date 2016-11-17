module ProjectsHelper
  def user_belongs_to_this_project?(project)
    if project.collaborators.include?(current_user) or project.author == current_user
      true
    else
      false
    end
  end
end
