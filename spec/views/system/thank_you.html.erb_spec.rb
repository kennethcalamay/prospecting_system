require "spec_helper"

describe "system/thank_you.html.erb" do
  it "shows a 'thank you' message" do
    render
    rendered.should contain(/thank you/i)
  end
end