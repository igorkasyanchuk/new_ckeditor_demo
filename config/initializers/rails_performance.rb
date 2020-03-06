RailsPerformance.setup do |config|
  redis = if Rails.env.production?
    Redis.new(url: ENV['REDIS_URL'])
  else
    Redis.new
  end

  config.redis    = Redis::Namespace.new("#{Rails.env}-rails-performance", redis: redis)
  config.duration = 8.hours

  config.debug    = false # currently not used>
  config.enabled  = true

  # protect your Performance Dashboard with HTTP BASIC password
  config.http_basic_authentication_enabled   = false
  config.http_basic_authentication_user_name = 'rails_performance'
  config.http_basic_authentication_password  = 'password12'

  # if you need an additional rules to check user permissions
  config.verify_access_proc = proc { |controller| true }
  # for example when you have `current_user`
  # config.verify_access_proc = proc { |controller| controller.current_user && controller.current_user.admin? }
end if defined?(RailsPerformance)