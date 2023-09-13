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
    ocr_text = response.responses[0].text_annotations[0].description
    @image.ocr_text = ocr_text

    min_sec = ocr_text.match(/(\d+分\s*\d+\s*秒)/)[0] # '〇〇分〇〇秒'を抽出
    min = min_sec.match(/(\d+)分/)[1].to_i # 分を抽出・数値化
    sec = min_sec.match(/(\d+\s*)秒/)[1].to_i # 秒を抽出・数値化
    kcal = ocr_text.match(/(\d+\.\d+kcal)/)[0].gsub(/kcal/, '').to_f # '〇〇.〇〇kcal'を抽出・数値化
    km = ocr_text.match(/(\d+\.\d+km)/)[0].gsub(/km/, '').to_f # '〇〇.〇〇km'を抽出・数値化

    act_date = Date.today
    act_time = min * 60 + sec # 時間を秒に変換
    act_calories = kcal # カロリー
    act_distance = km # 距離

    @activity_record = ActivityRecord.new(act_date:, act_time:, act_calories:, act_distance:)
    @activity_record.user_id = current_user.id

    if @image.save
      @activity_record.activity_image_id = @image.id
      @activity_record.save
      redirect_to edit_activity_record_path(@activity_record), notice: t('default.success')
    else
      render 'new'
    end
  end

  private

  def image_params
    params.require(:activity_image).permit(:image, :image_cache)
  end
end
