class ProductOrganizer
    def initialize(products)
      @products = products
    end
  
    def group_products_by_category
      result = {}
  
      @products.each do |product|
        category = product[:category]
  
        # Initialize category data if not already present
        result[category] ||= { products: [], total_count: 0, total_price: 0 }
  
        result[category][:products] << product[:name]
        result[category][:total_count] += 1
        result[category][:total_price] += product[:price]
      end
  
      result
    end

    def find_product_by_key(key)
        group_products_by_category[key][:products] || 0
    end

end

products = [
    { name: "Laptop", price: 1000, category: "Electronics" },
    { name: "Phone", price: 700, category: "Electronics" },
    { name: "T-shirt", price: 20, category: "Clothing" },
    { name: "Jeans", price: 40, category: "Clothing" },
    { name: "Fridge", price: 500, category: "Appliances" },
    { name: "Microwave", price: 150, category: "Appliances" }
]
  
organizer = ProductOrganizer.new(products)
p organizer.group_products_by_category
p organizer.find_product_by_key("Electronics")