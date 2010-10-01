ProspectingSystem::Application.routes.draw do
  resources :customers
  resources :prospects

  Product.all.each do |p|
    unless p.price > 0
      match '/' => 'prospects#new', :constraints => {:domain => p.domain}
    else
      match '/' => 'customers#index', :constraints => {:domain => p.domain}
    end
  end
end
