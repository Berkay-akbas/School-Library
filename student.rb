require './person'

class Student < Person
  def initialize(age, name = 'unknown', parent_permisison: true)
    super(name, age, parent_permisison)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end
end
