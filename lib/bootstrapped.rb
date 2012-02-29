unless RUBY_PLATFORM.eql?('java')
  require 'less'
  require 'less-rails'
end

require 'bootstrapped/version'
require 'bootstrapped/engine'

