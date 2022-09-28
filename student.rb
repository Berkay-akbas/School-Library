require './person'

class Student < Person
  def initialize(classroom, age, name = 'unknown', parent_permisison: true)
    super(name, age, parent_permisison)
    @classroom = classroom
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end
end
