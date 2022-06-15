require './decorator'

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
