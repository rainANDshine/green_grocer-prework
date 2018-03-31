def consolidate_cart(cart)
  hash = {}
  
  cart.each do |item|
    item.each do |name, data|
      data.each do |attribute, value|
        hash[name][attribute] = value
      end
    end
  end
    
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
