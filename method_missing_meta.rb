class Developer
  def method_missing(method_name)
    "#{method_name} method is not here...!"
  end

  def weekend
    "!..WOW..!"
  end
end

dev = Developer.new
puts dev.frontend
puts dev.backend
puts dev.weekend
