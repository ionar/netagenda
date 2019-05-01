module WelcomeHelper
	def welcome_message
		if current_user.active?
			return "Seu usuário está ativado"
		else
			return "Seu cadastro foi efetuado com sucesso. Agora solicite a ativação do seu usuário para o administrador do sistema."
		end
	end

	def admin_message
		if current_user.admin?
			return "Admin"
		end
	end
end
