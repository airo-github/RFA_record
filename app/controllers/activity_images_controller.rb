class ActivityImagesController < ApplicationController
  def new
    @image = ActivityImage.new
  end

  def create
    @image = ActivityImage.new(image_params)
    if @image.save
      redirect_to @image, notice: t(default.success)
    else
      render 'new'
    end
  end

  private

  def image_params
    params.require(:activity_images).permit(:image, :image_cache)
  end
end
