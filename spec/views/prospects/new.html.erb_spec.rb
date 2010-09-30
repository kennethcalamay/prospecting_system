require "spec_helper"

describe "prospects/new.html.erb" do
  it "contains 'Firstname'" do
    render
    rendered.should contain("Firstname")
  end

  it "contains 'Email'" do
    render
    rendered.should contain("Email")
  end

  it "contains 'Phone'" do
    render
    rendered.should contain("Phone")
  end
end