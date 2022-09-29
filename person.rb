require './nameable'
require './decorator'
require './rental'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permisison: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permisison = parent_permisison
    @rentals = []
  end

  attr_reader :id
  attr_writer :name, :age

  def can_use_services?
    @parent_permisison || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental unless @rentals.include?(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
