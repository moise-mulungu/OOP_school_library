class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.new.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    if @age >= 18 || @parent_permission
      true
    else
      false
    end
  end

  private
  def of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age?() || @parent_permission
 end

end

person = Person.new
person.of_age?
person.can_use_services?
