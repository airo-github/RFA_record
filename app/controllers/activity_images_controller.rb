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
    # OCR処理を追加
    image_annotator = Google::Cloud::Vision.image_annotator
    response = image_annotator.document_text_detection(
      image: @image.image.path, max_results: 1, image_context: { language_hints: %i[ja en] }
    )
    @image.ocr_text = response.responses[0].text_annotations[0].description

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
