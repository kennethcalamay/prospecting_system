module ApplicationHelper
  def title
    if @product
      @product.name.split(' ').each{ |s| s.capitalize! }.join(' ')
    else
      "The Online Prospecting System for Filipino Network Marketers"
    end
  end
end
