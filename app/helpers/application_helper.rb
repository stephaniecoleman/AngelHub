module ApplicationHelper

	def header_links
		if signed_in?
			render 'shared/signed_in_links'
		else
			render 'shared/signed_out_links'
		end
	end

  def modal_links
    if !signed_in?
      render 'shared/signin_modal'
    end
  end

end
