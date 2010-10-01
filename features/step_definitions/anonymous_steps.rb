Given /^the following products exist:$/ do |table|
  table.hashes.each do |attrs|
    create_product(attrs)
  end

  ProspectingSystem::Application.routes.draw do
    Product.all.each do |p|
      unless p.price > 0
        match '/' => 'prospects#new', :constraints => {:domain => p.domain}
      else
        match '/' => 'customers#index', :constraints => {:domain => p.domain}
      end
    end
  end
end

Given /^the domain name for the prospecting system is "([^"]*)"$/ do |dom|
end

When /^I visit "([^"]*)"$/ do |url|
  visit "http://#{url}:3000"
end

Then /^I must see "([^"]*)"$/ do |expected_outcome|
  case expected_outcome
  when /an opt\-in page for the product named (.*)/
    steps %Q{
      Then I should see "Firstname"
      Then I should see "Email"
      Then I should see "Phone"
      Then I should see "#{$1}"
    }

  when /a sales page for the product named (.*)/
    steps %Q{
      Then I should see "Buy now"
      Then I should see "#{$1}"
    }

  when /the login page/
    steps %Q{
      Then I should see "Username"
      Then I should see "Password"
    }
  end
end
