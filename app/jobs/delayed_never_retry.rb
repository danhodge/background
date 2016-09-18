class DelayedNeverRetry
  def self.perform_later
    Delayed::Job.enqueue(new)
  end

  def perform
    raise 'Failure'
  end

  def max_attempts
    1
  end

  def failure(job)
    Rails.logger.error "Job failed: #{job.last_error.each_line.first}"
  end
end
