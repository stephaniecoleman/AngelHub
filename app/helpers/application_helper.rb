module ApplicationHelper

	def header_links
		if signed_in?
			render 'shared/signed_in_links'
		else
			render 'shared/signed_out_links'
		end
	end

  def modal_links
    unless signed_in?
      render 'shared/signin_modal'
    end
  end

  def request_link
  	if current_user.class == Organization
  		render 'shared/request_link'
  	end
  end

  def project_link
    if signed_in?
      render 'shared/project_link'
    end
  end

  def request_modal
  	if !!request_link
  		render 'shared/request_modal'
  	end
  end

  def row_fill(scope)
    projects = Project.scope
    render 'shared/row', projects: projects
  end
end
