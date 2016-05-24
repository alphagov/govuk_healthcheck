module GovukHealthcheck
  OK = 'ok'.freeze
  CRITICAL = 'critical'.freeze

  class Checkup
    # @param checks [Array] Array of objects/classes that respond to `healthcheck`
    def initialize(checks)
      @checks = checks
    end

    def as_json
      {
        status: 'ok',
        checks: component_statuses,
      }
    end

  private

    def component_statuses
      @checks.reduce({}) do |hash, check_class|
        hash = hash.merge(check_class.check)
        hash
      end
    end
  end
end
