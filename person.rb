require './nameable'
require './decorator'


class Person < Nameable
  def initialize(age, name = 'unknown', parent_permisison: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permisison = parent_permisison
  end

  attr_reader :id
  attr_writer :name, :age

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


person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
 puts capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  puts capitalizedTrimmedPerson.correct_name