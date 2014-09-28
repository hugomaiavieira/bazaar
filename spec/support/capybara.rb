Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 2

# just an alias
def page!
  save_and_open_page
end
