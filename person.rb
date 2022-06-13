class Person
    def initialize(name = "Unknown", age, parent_permission = true)
        @id = Random.new.rand(1..100)
        @name = name
        @age = age
    end

    def parent_permission
        @parent_permission
    end

    attr_reader :id, :name, :age
    attr_writer :name, :age

    private
    def is_of_age?
        if @age >= 18
            true
        else
            false
        end
    end

    def can_use_services?
        if @age >= 18 || @parent_permission
            true
        else
            false
        end
    end
end

person = Person.new