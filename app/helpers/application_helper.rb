module ApplicationHelper
  def default_meta_tags
    {
      site: 'RFA_Record',
      title: 'RFAの活動記録を保存するサービス',
      reverse: true,
      charset: 'utf-8',
      description: '写真を撮るだけで活動記録が簡単に保存、グラフ化できます',
      keywords: 'リングフィットアドベンチャー',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('images/RFA_Record_OGP.jpeg'),
        local: 'ja-JP'
      }
    }
  end
end
