require 'mail_checker/version'
require 'mail_checker/mail'
require 'mail_checker/configuration'
require 'mail_checker/expectation_matcher'
require 'mail_checker/expectation'
require 'mail_checker/matchers'
require 'mail_checker/helpers'

module MailChecker
  def self.configure(&block)
    Configuration.new(&block).configure
  end

  def self.clear
    Mail.destroy_all
  end
end