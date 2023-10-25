class ActivityImage < ApplicationRecord
  belongs_to :user
  has_one :activity_record
  mount_uploader :image, ActivityImageUploader

  validates :image, presence: true

  def extract_and_parse_ocr_text
    response = Google::Cloud::Vision.image_annotator.document_text_detection(
      image: image.url, max_results: 1, image_context: { language_hints: %i[ja en] }
    )
    ocr_text = response.responses[0].text_annotations[0].description

    min_sec = ocr_text.match(/(\d+分\s*\d+\s*秒)/)[0] # '〇〇分〇〇秒'を抽出
    min = min_sec.match(/(\d+)分/)[1].to_i || 0
    sec = min_sec.match(/(\d+\s*)秒/)[1].to_i || 0
    kcal = ocr_text.match(/(\d+\.\d+kcal)/)[0].gsub(/kcal/, '').to_f || 0.0
    km = ocr_text.match(/(\d+\.\d+km)/)[0].gsub(/km/, '').to_f || 0.0

    {
      min:,
      sec:,
      kcal:,
      km:
    }
  end
end
