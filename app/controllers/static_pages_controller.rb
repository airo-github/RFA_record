class StaticPagesController < ApplicationController
  def top
    if current_user.nil?
      render 'top'
    else
      redirect_to activity_records_path
    end
  end

  def before_login
    if current_user.nil?
      render 'before_login'
    else
      redirect_to activity_records_path
    end
  end

  def terms; end

  def privacy; end

  def after_login
    login_required
  end
end
