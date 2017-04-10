class HomeController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :authenticate_user!, only: [:index, :login]

  def index
    if current_user.nil?
      redirect_to action: 'login'
    end
  end

  def login
    unless current_user.nil?
      redirect_to action: 'index'
    end
  end

  def logout
    sign_out current_user
    redirect_to action: 'login'
  end
end
