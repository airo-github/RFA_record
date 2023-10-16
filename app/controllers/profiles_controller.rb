class ProfilesController < ApplicationController
  before_action :set_user, only: %i[new edit update]
  before_action :login_required, only: %i[new show edit update]

  def new
    @activity_records = @user.activity_records.order(created_at: :desc).page(params[:page])
  end

  def show
    @records = current_user.activity_records.order(:act_date).pluck(:act_date, :act_time, :act_calories, :act_distance)
    @weekly_records = current_user.activity_records.where('act_date >= ?', 1.week.ago).order(:act_date).pluck(
      :act_date, :act_time, :act_calories, :act_distance
    )
    @monthly_records = current_user.activity_records.where('act_date >= ?', 1.month.ago).order(:act_date).pluck(
      :act_date, :act_time, :act_calories, :act_distance
    )
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
