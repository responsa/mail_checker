require 'timeout'

module MailChecker
  class ExpectationMatcher
    def matches?(expectation)
      attributes = {}
      attributes['subject'] = expectation.subject if expectation.subject
      attributes['sender'] = expectation.from if expectation.from
      attributes['recipients'] = expectation.to if expectation.to
      attributes.reverse_merge!(expectation.attributes) if expectation.attributes

      @attributes = attributes

      begin
        Timeout::timeout(5) do
          loop do
            break if MailChecker::Mail.any? do |mail|
              attributes.all? { |a, v| attribute_matches?([*mail.attributes[a]], to_regexp([*v])) }
            end

            sleep 0.5
          end
        end
      rescue Timeout::Error
        false
      else
        true
      end
    end

    def failure_message
      "A mail with #{@attributes} was expected to be delivered but was not.\n" +
      "List of received mails: #{MailChecker::Mail.all.map(&:attributes)}"
    end

    private

    def attribute_matches?(actual, expected)
      !expected.any? { |e| actual.any? { |a| a !~ e } }
    end

    def to_regexp(values)
      values.map { |v| Regexp.new(v) }
    end
  end
end