class SecuredController < ApplicationController

  before_filter :authorize_user!

  def authorize_user!
    unless current_user.is_admin?
      redirect_to root_url, alert: 'Only admins can perform this action!'
    end
  end
end