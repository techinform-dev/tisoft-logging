# Tisoft Logging

Gem configure common production logging settgins for for Techinform Soft applications.

## Installation

Add this line to your application's Gemfile:

```ruby
group :production do
    gem 'tisoft-logging'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tisoft-logging

## Usage

On production environment (config/environments/production.rb) add:
```ruby
My::Application.configure do
  # Your configuration
  TisoftLogging.setup(config: config, user_method: :current_user) if defined?(TisoftLogging)
end
```

## Options

* config (required) - pass your Rails configuration
* user_method (required) - controller method to get user in application
* fluentd_enabled (optional) - enable sending logs to fluentd, default is true
* host (optional) - host to send fluentd logs, default is 127.0.0.1

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/techinform.dev/tisoft-logging. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Tisoft Logging project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tisoft_logging/blob/master/CODE_OF_CONDUCT.md).
