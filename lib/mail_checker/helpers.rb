module MailChecker
  module Helpers
    def an_email(subject)
      MailChecker::Expectation.new(subject)
    end
  end
end