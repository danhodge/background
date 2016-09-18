class DelayedFourTries
  def self.perform_later
    Delayed::Job.enqueue(new)
  end

  def perform
    raise 'Failure'
  end

  def max_attempts
    4
  end
end
