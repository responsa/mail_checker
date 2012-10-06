module MailChecker
  class Configuration
    attr_accessor :host
    attr_accessor :port

    def initialize
      yield self
    end

    def configure
      MailChecker::Mail.site = "#{host}:#{port}"
    end
  end
end