class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :query_for_product

  private

  def query_for_product
    @product = Product.find_by_domain(request.domain)
  end
end
