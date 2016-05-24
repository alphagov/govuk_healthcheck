module GovukHealthcheck
  module RailsDatabase
    def self.check
      {
        database_connectivity: {
          status: ActiveRecord::Base.connected? ? OK : CRITICAL
        }
      }
    end
  end
end
