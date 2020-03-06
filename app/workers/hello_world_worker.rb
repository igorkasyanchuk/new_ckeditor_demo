class HelloWorldWorker
  include Sidekiq::Worker

  def perform(*args)
    sleep(rand(30))
  end
end
