require 'spec_helper'

describe Product do
  before do
    @product = Product.new(:name => 'p', :domain => 'p.com', :price => 0.0)
  end

  it "is only valid with valid attributes" do
    @product.should be_valid
  end

  it "is not valid without a name" do
    @product.name = nil
    @product.should_not be_valid
  end

  it "is not valid without a domain" do
    @product.domain = nil
    @product.should_not be_valid
  end

  it "is not valid without a price" do
    @product.price = nil
    @product.should_not be_valid
  end

  context "price" do
    it "is not valid if not numeric" do
    @product.price = 'a'
    @product.should_not be_valid
  end

  it "is not valid if less than zero" do
    @product.price = -1
    @product.should_not be_valid
  end
  end

  context "domain" do
    it "is valid with one or two dots" do
      valids = ['domain.com', 'domain.com.ph']
      valids.each do |domain|
        @product.domain = domain
        @product.should be_valid
      end
    end
  end
  
end
