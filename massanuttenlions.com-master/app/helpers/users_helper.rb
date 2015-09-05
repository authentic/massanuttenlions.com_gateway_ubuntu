module UsersHelper

  def admin_user
    redirect_to(new_user_session_path) if !current_user.has_role? :admin || current_user?(@user)
  end
end
