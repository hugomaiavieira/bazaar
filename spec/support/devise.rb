RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end

### Ref.: http://goo.gl/5F2xXZ
Devise.stretches = 1
