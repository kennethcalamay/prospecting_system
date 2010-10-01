class Prospect < ActiveRecord::Base
  validates :firstname, :presence => true,
       :format => {:with => /^[a-z]+[\.\-\s]*[a-z]+[\.]*$/i}

  validates :email, :presence => true,
       :format => {:with => /^[a-z]+([a-z0-9]*[\.\-\_\+]*[a-z0-9]+)*@[a-z0-9]+\.[a-z]+$/i }
end
