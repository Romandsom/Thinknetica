module BrandNaming
  attr_accessor :brand

  def naming(name)
    self.brand = name
  end

  def brand_name
    p self.brand
  end
end
