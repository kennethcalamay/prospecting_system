class CustomersController < ApplicationController
  def index
    @product = Product.find_by_domain(request.domain)
  end
end
