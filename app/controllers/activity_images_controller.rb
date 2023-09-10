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
    ocr = RTesseract.new(@image.image.path, lang: 'jpn') # 画像のパスからOCR処理を実行
    @image.ocr_text = ocr.to_s # OCRの結果をデータベースに保存

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
