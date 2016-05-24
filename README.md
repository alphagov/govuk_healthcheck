# GovukHealthcheck

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'govuk_healthcheck'
```

For Rails apps:

```ruby
module CustomCheck
  def self.check
    {
      my_custom_check: {
        status: everything_okay? ? 'ok' : 'critical'
      }
    }
  end
end

get '/healthcheck', to: GovukHealthcheck.rack_response(
  GovukHealthcheck::SidekiqRedis,
  GovukHealthcheck::RailsDatabase,
  CustomCheck
)
```

This will check:

- Redis connectivity (via Sidekiq)
- Database connectivity (via ActiveRecord)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/govuk_healthcheck/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
