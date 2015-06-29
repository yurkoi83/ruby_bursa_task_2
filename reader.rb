class Reader
  attr_accessor :name, :reading_speed

  def initialize name, reading_speed
    @name = name
    @reding_speed = reading_speed
  end

  def time_to_finish book, current_page
    (book.pages_quantity - current_page) / reading_speed
  end
end
