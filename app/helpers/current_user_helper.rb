module CurrentUserHelper
  def current_user
    current_developer || current_organization
  end

  def signed_in?
    developer_signed_in? || organization_signed_in?
  end
  
  def destroy_session_path
    case current_user
    when Developer
      destroy_developer_session_path
    when Organization
      destroy_organization_session_path
    end
  end
end
