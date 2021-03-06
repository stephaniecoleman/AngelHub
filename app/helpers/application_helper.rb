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

  def row_fill_p(skope, *arg)
    projects = Project.send(skope, *arg)
    render 'shared/row', projects: projects
  end

  def row_fill_o(skope, *arg)
    orgs = Organization.send(skope, *arg)
    render 'shared/row', projects: orgs
  end

  def row_fill_user(skope, *arg)
    projects = current_user.projects.send(skope, *arg)
    render 'shared/row', projects: projects
  end

  def status_button(user, project)
    html = ""
    if user.class == Organization && user.id == project.organization_id
      html << render('shared/button_delete', project: project)
      if project.status == "in_progress"
        html << render('shared/button_complete', project: project)
      end
    elsif user.class == Developer && !project.developers.include?(user) 
      if project.status != "finished"
        html << render('shared/button_apply', project: project)
      end
     end 
     html.html_safe
  end
end
