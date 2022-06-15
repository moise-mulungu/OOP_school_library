require './nameable'

# Prepare a base decorator class
class BaseDecorator < Nameable
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
    @word_length = @nameable.correct_name.length
    @word_trim = @nameable.correct_name
    if @word_length <= 10
      puts @word_trim
    else
      (0..@word_length).each do |_i|
        next unless @word_length > 10

        @word_trim = @word_trim.chop
        @word_length = @word_trim.length
        puts @word_trim
      end
    end
  end
end
