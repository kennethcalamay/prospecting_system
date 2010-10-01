require "spec_helper"

describe "customers/index.html.erb" do
  it "contains 'Buy now'" do
    render
    rendered.should contain('Buy now')
  end
end