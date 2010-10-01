require "spec_helper"

describe CustomersController do
  describe "GET 'index'" do
    it "returns success code" do
      get 'index'
      response.should be_success
    end
  end
end