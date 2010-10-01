module ApplicationHelper
  def title
    # capitalize every word in product.name and return it as the title
    @product.name.split(' ').each{ |s| s.capitalize! }.join(' ')
  end
end
