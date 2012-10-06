lib = File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mail_checker/version'

Gem::Specification.new do |gem|
  gem.name          = 'mail_checker'
  gem.version       = MailChecker::VERSION
  gem.authors       = ['Eugenio Depalo']
  gem.email         = %w(eugeniodepalo@gmail.com)
  gem.description   = %q{RSpec matchers and helpers to set expectations on mails delivered to MailCatcher}
  gem.summary       = %q{Test mails sent to a MailCatcher SMTP server}
  gem.homepage      = 'https://github.com/responsa/mail_checker'
  
  gem.add_dependency  'activeresource'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
