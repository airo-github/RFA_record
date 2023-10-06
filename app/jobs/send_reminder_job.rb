class SendReminderJob < ApplicationJob
  queue_as :default

  def perform(user_id, message)
    user = User.find(user_id)
    send_line_notification(user, message)
  end

  private

  def send_line_notification(user, message)
    line_api_endpoint = 'https://api.line.me/v2/bot/message/push'
    access_token = 'LINE_CHANNEL_TOKEN'

    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{access_token}"
    }

    payload = {
      to: user.line_user_id,
      messages: [
        {
          type: 'text',
          text: message
        }
      ]
    }

    RestClient.post(line_api_endpoint, payload.to_json, headers)
  end
end
