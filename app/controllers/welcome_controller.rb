class WelcomeController < ApplicationController
	 skip_authorization_check only: [:index, :cadastros, :success]
  def index
  end
  def success
  end
  def cadastros
  end  
end
