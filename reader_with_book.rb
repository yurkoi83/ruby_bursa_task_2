class ReaderWithBook < Reader
  attr_accessor :book, :current_page

  def initialize  name, reading_speed, book, current_page
    @book = book
    @current_page = current_page
    super name, reading_speed
  end 

  def time_to_finish
    ((book.pages_quantity - current_page) / reading_speed).ceil
  end
  
  def penalty hours
  	(book.penalty_per_hour*hours).round(0)
  end
  
  def penalty_per_hour
    (book.penalty_per_hour/100).round(2)
  end

  def day_to_buy
    (book.hour_for_buy / 24).ceil
  end
  def title
     book.title
  end
  def author_name
     book.author_name
  end
end
