require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = nil
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom = (classroom)
    @classroom = classroom
    classroom.students.push(self) unless students.include?(self)
  end
end
