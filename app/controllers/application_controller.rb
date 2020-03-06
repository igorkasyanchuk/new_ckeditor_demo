class ApplicationController < ActionController::Base

  before_action :start_workers

  # for demo of rails_performance
  def start_workers
    rand(3).times { JustSimpleWorker.perform_async }
  end

end
