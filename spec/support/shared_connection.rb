# https://gist.github.com/josevalim/470808
# This comment solve the postgres muitiple connections
# https://gist.github.com/josevalim/470808#comment-474499

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || ConnectionPool::Wrapper.new(:size => 1) { retrieve_connection }
    # @@shared_connection || retrieve_connection
  end
end

# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection


# https://gist.github.com/josevalim/470808#comment-896799
RSpec.configure do |config|
  require 'timeout'
  config.after(:each, js: true) do |example|
    Timeout.timeout(Capybara.default_wait_time) do
      until (i = page.evaluate_script("$.active")).zero?
        puts "--> example [#{example.description}] has #{i} outstanding XHR(s)"
        sleep 0.1
      end
    end
  end
end
