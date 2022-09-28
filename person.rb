class Person
  def initialize(age, name: 'unknown', parent_permisison: true)
    @id = 0
    @name = name
    @age = age
    @parent_permisison = parent_permisison
  end

  attr_reader :id
  attr_writer :name, :age

  def can_use_services?
    @parent_permisison || @age >= 18
  end

  private

  def of_age?
    @age >= 18
  end
end
