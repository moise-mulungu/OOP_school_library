require "./person.rb"

class Teacher < Person
    def initialize(name = "Unknown", age, parent_permission == true, specialization)
        super(name, age, parent_permission)
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end

teacher = Teacher.new
teacher.can_use_services?()