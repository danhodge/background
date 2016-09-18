class ActiveNeverRetry < ApplicationJob
  queue_as :default

  rescue_from(StandardError) do |exception|
    Rails.logger.error "Job failed: #{exception.message}"
  end

  def perform
    raise 'Failure'
  end
end
