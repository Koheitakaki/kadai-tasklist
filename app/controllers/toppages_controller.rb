class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @tasks = Task.all.page(params[:page])
    end
  end
end
