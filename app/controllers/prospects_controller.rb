class ProspectsController < ApplicationController
  def new
    @product = Product.find_by_domain(request.domain)
  end
end
