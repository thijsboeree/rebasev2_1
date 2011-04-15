class HomeController < ApplicationController

	def index
		redirect_to :controller => :questions, :action => :index if user_signed_in?
	end

end
