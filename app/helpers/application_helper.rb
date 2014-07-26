module ApplicationHelper

	def load_header
		if signed_in?
			render 'shared/signed_in_header'
		else
			render 'shared/signed_out_header'
		end
	end
	
end
