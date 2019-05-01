class WelcomeController < ApplicationController
	 skip_authorization_check only: [:index, :cadastros]
  def index
  end
  def cadastros
  end  
end
