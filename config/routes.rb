ProspectingSystem::Application.routes.draw do
  resources :prospects

  products = Product.all
  products.each do |p|
    unless p.price > 0
      match '/' => 'prospects#new', :constraints => {:domain => p.domain}
    end
  end
end
