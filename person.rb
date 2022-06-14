require './nameable'

class Person < Nameable

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.new.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  # Adding a correct_name class
  def correct_name
    @name = name
  end
end

person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name
