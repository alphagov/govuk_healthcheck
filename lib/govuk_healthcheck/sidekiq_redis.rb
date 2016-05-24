module GovukHealthcheck
  module SidekiqRedis
    def self.check
      {
        redis_connectivity: {
          status: Sidekiq.redis(&:info) ? OK : CRITICAL
        }
      }
    end
  end
end
