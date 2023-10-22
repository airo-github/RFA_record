set :output, '/path/to/cron.log'

every 5.minutes do
  runner 'LineNotificationJob.perform_later'
end
