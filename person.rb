require './nameable'
require './decorator'
require './capitalize'
require './trimmer'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.new.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  # Adding a correct_name class
  def correct_name
    @name
  end

  def add_rental(rental)
    @rental.push(rental)
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
