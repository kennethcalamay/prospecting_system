require "spec_helper"

describe CustomersController do
  describe "GET 'index'" do
    let(:product) { mock_model('Product') }

    before do
      Product.stub(:find_by_domain).and_return(product)
      @request.host = "www.somedomain.com"
    end

    it "queries for the product associated with the request's domain name" do
      Product.should_receive(:find_by_domain).with(@request.domain)
      get 'index'
    end

    it "assigns @product" do
      get 'index'
      assigns(:product).should eq(product)
    end
  end
end