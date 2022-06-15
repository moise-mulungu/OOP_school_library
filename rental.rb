class Rental
    attr_reader :book, :person
    attr_accessor :date

    def initialize(date, person, book)
        @date = date

        @book = book
        book.rental << self

        @person = person
        person.rental << self
    end
end