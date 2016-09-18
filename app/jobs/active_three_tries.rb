class ActiveThreeTries < ApplicationJob
  queue_as :default

  def perform
    raise 'Failure'
  end
end
