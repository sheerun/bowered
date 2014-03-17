require 'bowered'

RSpec.configure do |config|

  # Disable .should syntax, prefer expect()
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

end
