module UsersHelper
	def is_admin?(user)
		if user.admin?
			return "sim"
		else
			return "não"
		end
	end

	def is_active?(user)
		if user.active?
			return "sim"
		else
			return "não"
		end
	end
end
