require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permisison: true)
    super(name, age, parent_permisison)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
