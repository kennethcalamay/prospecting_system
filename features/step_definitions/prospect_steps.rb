When /^I opt\-in with "([^"]*)", "([^"]*)", and "([^"]*)"$/ do |firstname, email, phone|
  steps %Q{
    When I fill in "Firstname" with "#{firstname}"
    And I fill in "Email" with "#{email}"
    And I fill in "Phone" with "#{phone}"
    And I press "Submit"
  }
  follow_redirect! if response.redirect?
end