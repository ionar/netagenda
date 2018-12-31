module ApplicationHelper
	def active?(controller_name)
    servlet = params[:controller]
    if servlet == controller_name
      "active"
    else
     ""
    end
end
end
