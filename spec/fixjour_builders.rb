module Fixjour
  define_builder(Product) do |klass, overrides|
    klass.new(
      :name => 'someproduct',
      :domain => 'somedomain',
      :price => 0.0
    )
  end
end