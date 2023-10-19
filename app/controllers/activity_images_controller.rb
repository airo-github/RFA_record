class ActivityImagesController < ApplicationController
  before_action :login_required, only: %i[new create]

  def index
    @images = ActivityImage.all.includes(:user).order(created_at: :desc)
  end

  def new
    @image = ActivityImage.new
  end

  def create
    @image = ActivityImage.new(image_params)
    @image.user_id = current_user.id

    if @image.save
      activity_record = ActivityRecord.create_new_record(@image, @image.extract_and_parse_ocr_text, current_user)

      if activity_record
        redirect_to edit_activity_record_path(activity_record), success: t('defaults.success')
      else
        flash.now['danger'] = t('defaults.message.not_created', item: ActivityImage.model_name.human)
        render :new, status: :see_other
      end
    else
      flash.now['danger'] = t('defaults.message.not_created', item: ActivityRecord.model_name.human)
      render :new, status: :see_other
    end
  end

  private

  def image_params
    params.require(:activity_image).permit(:image, :image_cache)
  end
end
