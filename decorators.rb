require './nameable'

# Prepare a base decorator class
class BaseDecorator
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# Prepare a capitalize decorator class
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# Prepare a trimmer decorator class
class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.[0..10]
  end
end
