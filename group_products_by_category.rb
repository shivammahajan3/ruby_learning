def group_products_by_category(arr_hash)
    hash = {}
    arr_hash.each do |product|
        category = product[:category]
        hash[category] = {products:[], total_count: 0, total_price: 0}
    end

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
  { name: "Laptop", price: 1000, category: "Electronics" },
  { name: "Phone", price: 700, category: "Electronics" },
  { name: "T-shirt", price: 20, category: "Clothing" },
  { name: "Jeans", price: 40, category: "Clothing" },
  { name: "Fridge", price: 500, category: "Appliances" },
  { name: "Microwave", price: 150, category: "Appliances" }
]

p group_products_by_category(products)