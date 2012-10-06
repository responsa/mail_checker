module MailChecker
  class Expectation
    attr_reader :subject, :attributes

    def initialize(subject = nil)
      @subject = subject
    end

    def to(*args)
      return @to if args.empty?
      @to = args.first
      self
    end

    def from(*args)
      return @from if args.empty?
      @from = args.first
      self
    end

    def with(attributes)
      @attributes = attributes
      self
    end
  end
end