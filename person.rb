require './nameable'
require './decorator'
require './rental'

class Person < Nameable
  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age

  def can_use_services?
    @parent_permisison || of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
