Given /^the following products exist:$/ do |table|
  table.hashes.each do |attrs|
    create_product(attrs)
  end
end

Given /^the domain name for the prospecting system is "([^"]*)"$/ do |dom|
end
