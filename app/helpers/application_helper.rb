module ApplicationHelper
 		
	def active?(controller_name)
    servlet = params[:controller]
	    if servlet == controller_name
	      "active"
	    else
	     ""
	    end
	end

	def materialize_class_for(flash_type)
		case flash_type
		when "success"
		"deep-purple darken-1"
		when "error"
		"red darken-1"
		when "alert"
		"yellow darken-2"
		when "notice"
		"blue darken-1"
		else
		flash_type.to_s
		end
	end

	def icon_type_for(flash_type)
		case flash_type
		when "success"
		"done"
		when "error"
		"error_outline"
		when "alert"
		"warning"
		when "notice"
		"priority_high"
		else
		flash_type.to_s
		end
	end

	def dia_selected_helper
	    if params[:dia].present?
	      return Date.parse(params[:dia])
	    else
	      return Date.current
	    end
  	end

  	def onde_estou
    	cont = params[:controller]
    	page = action_name
    	return cont + '/' + page
	end
end