class HardWorker
  include Sidekiq::Worker
  def perform(derek)
    Populate.new
  end
end