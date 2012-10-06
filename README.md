# MailChecker

RSpec matchers and helpers to set expectations on mails delivered to MailCatcher

## Installation

Add this line to your application's Gemfile:

    gem 'mail_checker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mail_checker

## Usage

Configure RSpec to use MailChecker:

RSpec.configure do |config|
  config.include MailChecker::Helpers
  config.include MailChecker::Matchers

  config.before(:each) do
    MailChecker.clear
  end

  config.before(:suite) do
    MailChecker.configure do |config|
      config.host = 'localhost'
      config.port = 1080
    end
  end
end

Setup expectations in your tests:

an_email(/Example Subject/).
to('user@example.com').
from('noreply@example.com').
should have_been_delivered

Every expectation method accepts strings, regexps, arrays of strings or arrays of regexps.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
