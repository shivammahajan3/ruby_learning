require_relative 'product_grouping' 

class ProductOrganizer

  include ProductGrouping
  attr_accessor :result

  def initialize(products)
    @result = group_products_by_category_result(products)
  end
>>>>>>> training-20-december-2024

    arr_hash.each do |product|
        hash.keys.each do |key|
            if product[:category] == key
                hash[key][:products] << product[:name]
                hash[key][:total_count] += 1
                hash[key][:total_price] += product[:price]
            end
        end
    end
    hash
end

products = [
  { name: 'Laptop', price: 1000, category: 'Electronics' },
  { name: 'Phone', price: 700, category: 'Electronics' },
  { name: 'T-shirt', price: 20, category: 'Clothing' },
  { name: 'Jeans', price: 40, category: 'Clothing' },
  { name: 'Fridge', price: 500, category: 'Appliances' },
  { name: 'Microwave', price: 150, category: 'Appliances' }
] * 100000

organizer = ProductOrganizer.new(products)
p organizer.group_products_by_category
p organizer.find_product_by_category('Electronics')
p organizer.find_product_by_category('Clothing')
p organizer.find_product_by_category('Electronicsrgjrfj')

