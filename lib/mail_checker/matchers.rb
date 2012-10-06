module MailChecker
  module Matchers
    def have_been_delivered
      MailChecker::ExpectationMatcher.new
    end
  end
end