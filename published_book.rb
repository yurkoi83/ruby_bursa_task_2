class PublishedBook < Book
  attr_accessor :price, :pages_quantity, :published_at

  def initialize author, title, price, pages_quantity, published_at
    @price = price
    @pages_quantity = pages_quantity
    @published_at = published_at
    super author, title
  end
  def age
  	Time.now.utc.year-published_at-1
  end
  def penalty_per_hour
    price*0.0005+price*pages_quantity*0.000003+price*age*0.00007
  end
  def hour_for_buy
    price/penalty_per_hour
  end
  def author_name
    author.name
  end
end
