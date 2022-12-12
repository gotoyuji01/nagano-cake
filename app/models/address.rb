class Address < ApplicationRecord
  belongs_to :customer
 
  def full_addresses
    [postal_code, address, name].join('')
  end
  
  
end
