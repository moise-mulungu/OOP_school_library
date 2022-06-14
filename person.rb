require "./nameable.rb"

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
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

person = Person.new
person.of_age?
person.can_use_services?
