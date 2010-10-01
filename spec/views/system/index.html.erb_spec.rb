require "spec_helper"

describe "system/index.html.erb" do
  it "contains 'Username'" do
    render
    rendered.should contain("Username")
  end

  it "contains 'Password'" do
    render
    rendered.should contain("Password")
  end
end