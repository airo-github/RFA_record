class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :login_required, only: %i[show edit update]

  def show
    @records = current_user.activity_records.order(:act_date).pluck(:act_date, :act_time, :act_calories, :act_distance)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:nickname, :avatar, :avatar_cache, :twitter_url, :introduction)
  end
end
