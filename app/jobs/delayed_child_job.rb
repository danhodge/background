class DelayedChildJob
  def self.perform_later
    Delayed::Job.enqueue(new)
  end

  def initialize(id)
    @id = id
    @curr_attempt = 0
  end

  def before(job)
    @curr_attempt = job.attempts + 1
  end

  def perform
    raise 'Failure' if @curr_attempt == 1
  end

  def error(job, exception)
    Rails.logger.debug "Error in child Job id=#{@id} attempt# #{job.attempts}, #{exception.message}"
  end

  def success(job)
    Rails.logger.debug "Child Job id=#{@id} finished successfully after: #{job.attempts} attempts"
  end

  def max_attempts
    2
  end
end
