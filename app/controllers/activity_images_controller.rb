class ActivityImagesController < ApplicationController
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
      redirect_to activity_images_path, notice: t('default.success')
    else
      render 'new'
    end
  end

  private

  def image_params
    params.require(:activity_image).permit(:image, :image_cache)
  end
end
