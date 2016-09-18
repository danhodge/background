class ActiveThreeRetries < ApplicationJob
  queue_as :default

  def perform
    raise 'Failure'
  end
end
