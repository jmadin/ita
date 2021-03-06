class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  WillPaginate.per_page = 8
  
  before_filter :set_last_seen_at, if: proc { |p| signed_in? && (session[:last_seen_at] == nil || session[:last_seen_at] < 15.minutes.ago) }

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless (current_user?(@user) or current_user.admin?)
  end

  def admin_user
    if not current_user.admin?
      flash[:warning] = "Not allowed."
      redirect_to(root_url)
    end 
  end

  private

    def set_last_seen_at
      current_user.update_attribute(:last_seen_at, Time.now)
      session[:last_seen_at] = Time.now
    end
 
end
