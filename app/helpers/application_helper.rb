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
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@Rz0Bp',
        image: image_url('ogp.png')
      }
    }
  end
end
