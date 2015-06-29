class PublishedBook < Book
  attr_accessor :price, :pages_quantity

  def initialize author, title, price, pages_quantity
    @price = price
    @pages_quantity = pages_quantity
    super author, title
  end

end
