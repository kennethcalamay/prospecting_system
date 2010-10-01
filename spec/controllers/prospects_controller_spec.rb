require "spec_helper"

describe ProspectsController do
  describe "GET 'new'" do
    it "returns success code" do
      get 'new'
      response.should be_success
    end
  end
end

