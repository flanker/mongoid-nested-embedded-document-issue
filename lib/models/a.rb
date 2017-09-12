class A
  include Mongoid::Document

  embeds_many :bs

end
