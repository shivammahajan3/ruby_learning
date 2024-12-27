module ProductGrouping
  def group_products_by_category_result(products)
    result = {}
    products.each do |product|
      category = product[:category]

      result[category] ||= { products: [], total_count: 0, total_price: 0 }

      result[category][:products] << product[:name]
      result[category][:total_count] += 1
      result[category][:total_price] += product[:price]
    end
    result
  end

  def group_products_by_category
    result
  end

  def find_product_by_category(key)
    result[key] ? result[key][:products] : 0
  end
end

