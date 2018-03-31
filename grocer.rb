def consolidate_cart(cart)
  hash = {}
  pre_item = nil
  count = 1
  
  cart.each do |item|
    if pre_item == nil || pre_item != item
      count = 1
      pre_item = item
    else  
      count += 1
    end
    
    item.each do |name, data|
      data.each do |attribute, value|
        if hash[name] == nil
          hash[name] = {attribute => value}
        else
          hash[name][attribute] = value
        end
      end
      
      hash[name][:count] = count
    end
  end
  
  hash  
end

def apply_coupons(cart, coupons)
  hash = {}
  
  cart.each do |item, attribute|
    if item == coupons[:item]
      count = attribute[:count] / coupons[:num]
      if count >= 1
        hash["#{item} W/COUPON"] = 
          {:price => coupons[:cost], :clearance => attribute[:clearance], :count => count}
        
        remainder = attribute[:count] % coupons[:num]
        hash[item] = {:price => attribute[:price], :clearance => attribute[:clearance], :count => remainder}
      end
    else
      hash[item] = attribute
    end
  end
  
  hash
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
