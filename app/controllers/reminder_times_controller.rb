class ReminderTimesController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :login_required, only: %i[new create]

  def new; end

  def create
    @user = current_user
    if @user.update(reminder_time_params)
      SendReminderJob.set(wait_until: @user.reminder_time).perform_later(@user.id, 'リマインド通知です。')
      redirect_to profile_path, success: '通知時間が設定されました。'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def reminder_time_params
    params.require(:user).permit(:reminder_time)
  end
end
