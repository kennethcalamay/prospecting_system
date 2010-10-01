ProspectingSystem::Application.routes.draw do
  get 'system/thank_you'

  resources :customers
  resources :prospects

  if defined?(Product)
    Product.all.each do |p|
      unless p.price > 0
        match '/' => 'prospects#new', :constraints => {:domain => p.domain}
      else
        match '/' => 'customers#index', :constraints => {:domain => p.domain}
      end
    end
  end

  root :to => 'system#index'
end
