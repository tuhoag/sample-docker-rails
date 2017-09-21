module ArticlesHelper
	def flash_class(key)
		case key
		when "success"
			"alert-success"
		when "error"
			"alert-danger"
		end
	end
end
