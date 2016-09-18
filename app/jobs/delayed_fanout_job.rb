class DelayedFanoutJob
  def self.perform_later(queue:, **kwargs)
    queue.enqueue(new(queue: queue, **kwargs))
  end

  def initialize(count:, queue:)
    @count = count
    @queue = queue
  end

  def perform
    @count.times.each do |i|
      @queue.enqueue(DelayedChildJob.new(i))
    end
  end

  def max_attempts
    1
  end
end
