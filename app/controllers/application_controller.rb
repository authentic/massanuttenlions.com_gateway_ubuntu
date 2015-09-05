class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def admin_user
    redirect_to(new_user_session_path) if !current_user.has_role? :admin || current_user?(@user)
  end

  def advertising
    @advertising_section=Page.find_by_id(76)
  end


  protected
  def layout_by_resource
    if controller_name == 'registrations' && action_name == 'new'
      'login'
    elsif controller_name == 'registrations' && action_name == 'edit'
      'login'
    elsif controller_name == 'registrations' && action_name == 'create'
      'login'
    elsif controller_name == 'registrations' && action_name == 'update'
      'login'
    elsif controller_name == 'passwords' && action_name == 'edit'
      'login'
    elsif controller_name == 'confirmations' && action_name == 'new'
      'login'
    elsif controller_name == 'confirmations' && action_name == 'create'
      'login'
    elsif controller_name == 'confirmations' && action_name == 'show'
      'login'
    elsif controller_name == 'passwords' && action_name == 'new'
      'login'
    elsif controller_name == 'passwords' && action_name == 'create'
      'login'
    elsif controller_name == 'sessions' && action_name == 'new'
      'login'
    elsif controller_name == 'sessions' && action_name == 'create'
      'login'
    elsif controller_name == 'sessions' && action_name == 'destroy'
      'login'
    elsif controller_name == 'unlocks' && action_name == 'new'
      'login'
    elsif controller_name == 'unlocks' && action_name == 'create'
      'login'
    elsif controller_name == 'passwords' && action_name == 'update'
      'login'
    else
      'application'
    end
  end

end
