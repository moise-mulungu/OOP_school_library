require "./nameable.rb"

class Base_Decorator
    attr_accessor :nameable

    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable.correct_name?
    end
end

class Capitalize_Decorator < Base_Decorator
    def correct_name
        @nameable.correct_name.upcase()
    end
end

class Trimmer_Decorator < Base_Decorator
    def correct_name
        @nameable.correct_name.strip
    end
end