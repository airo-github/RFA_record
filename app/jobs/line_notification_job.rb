class LineNotificationJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    system('pyenv init')
    system('gdircolors ~/.dircolors-solarized/dircolors.256dark')
    # Userのreminder_timeカラムを参照して、通知するユーザーを取得
    users = User.where('reminder_time < ?', Time.current)

    users.each do |user|
      message = {
        type: 'text',
        text: "#{user.name}さん、リマインダーの時間です!"
      }

      # LINE APIを利用して、メッセージを送信
      client = Line::Bot::Client.new do |config|
        config.channel_id = ENV['LINE_CHANNEL_ID']
        config.channel_secret = ENV['LINE_CHANNEL_SECRET']
        config.channel_token = ENV['LINE_CHANNEL_TOKEN']
      end
      response = client.push_message(user.line_user_id, message)
    end
  end
end
