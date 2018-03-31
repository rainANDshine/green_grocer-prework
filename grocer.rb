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
    coupons.each do |coupon_attribute|
      if item == coupon_attribute[:item]
        count = (attribute[:count] / coupon_attribute[:num]).floor
        if count >= 1
        hash["#{item} W/COUPON"] = 
          {:price => coupon_attribute[:cost], :clearance => attribute[:clearance], :count => count}
        
        remainder = attribute[:count] % coupon_attribute[:num]
        hash[item] = {:price => attribute[:price], :clearance => attribute[:clearance], :count => remainder}
        end
      else
        hash[item] = attribute
      end
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
