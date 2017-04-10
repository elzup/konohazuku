class HomeController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :authenticate_user!, only: [:index]
  def index
  end

  def logout
    sign_out current_user
    redirect_to action: 'index'
  end
end
