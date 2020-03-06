class JustSimpleWorker
  include Sidekiq::Worker

  def perform(*args)
    sleep(rand(10) / 10.0)
  end
end
