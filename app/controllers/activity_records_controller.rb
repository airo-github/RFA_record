class ActivityRecordsController < ApplicationController
  def index
    @activity_records = ActivityRecord.where(visible: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def edit
    @activity_record = ActivityRecord.find(params[:id])
  end

  def update
    @activity_record = ActivityRecord.find(params[:id])

    if @activity_record.update(activity_record_params)
      redirect_to activity_records_path, success: t('record.update')
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: ActivityRecord.model_name.human)
      render :edit, status: :see_other
    end
  end

  def destroy
    @activity_record = current_user.activity_records.find(params[:id])
    @activity_record.destroy!
    redirect_to activity_records_path, danger: t('record.destroy'),
                                       status: :see_other
  end

  private

  def activity_record_params
    params.require(:activity_record).permit(:act_date, :act_time, :act_calories, :act_distance, :comment, :visible)
  end
end
