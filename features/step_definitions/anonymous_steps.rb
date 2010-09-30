Given /^the following products exist:$/ do |table|
  table.hashes.each do |attrs|
    create_product(attrs)
  end
end