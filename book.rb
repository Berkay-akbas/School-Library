class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
  attr_accessor :title, :author
  attr_reader :rentals
  
  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental unless @rentals.include?(rental)
  end
end
