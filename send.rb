class Developer
   
  private
  
  def backend(lang)
    "#{lang} not supported..!"
  end
  protected

  def frontend
    'HTML_CSS_JS'
  end
end

dev = Developer.new
# dev.backend('ruby')   # it will gives the error  private method `backend' called for an instance of Developer (NoMethodError)
puts dev.send(:backend,'ruby')   # using of send we can call both private & protected method
puts dev.send('frontend')  # we can use the both string and symbol for method calling