require './person'

class Teacher < Person
  def initialize(specialization, age, name: 'unknown')
    super(age, parent_permission: true, name: name)
    @specialization = specialization
  end
  attr_reader :specialization

  def can_use_services?
    true
  end
end
