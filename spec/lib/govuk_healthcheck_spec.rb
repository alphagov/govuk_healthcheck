require 'spec_helper'

RSpec.describe GovukHealthcheck do
  describe '.rack_response' do
    it 'works with all built-in checks and a custom check' do
      # set up all the fake stuff
      class Sidekiq
        def self.redis
        end
      end

      module ActiveRecord
        class Base
          def self.connected?
            true
          end
        end
      end

      # A custom check
      module CustomCheck
        def self.check
          {
            my_custom_check: {
              status: 'ok'
            }
          }
        end
      end

      response_method = GovukHealthcheck.rack_response(
        GovukHealthcheck::SidekiqRedis,
        GovukHealthcheck::RailsDatabase,
        CustomCheck
      )

      status_code, headers, body = response_method.call
      response = JSON.parse(body.first)

      expect(response).to eql({
          "status" => "ok",
          "checks" => {
            "redis_connectivity" => { "status" => "critical" },
            "database_connectivity" => { "status" => "ok" },
            "my_custom_check" => { "status" => "ok" }
          }
        }
      )
    end
  end
end
