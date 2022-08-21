class UpdateElasticSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Message.__elasticsearch__.create_index!
  end
end
