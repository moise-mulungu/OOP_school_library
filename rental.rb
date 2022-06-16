class Rental
  attr_accessor :book, :person, :date

  def initialize(date, person, book)
    @date = date

    @book = book
    book.rental.push(self) unless book.rental.include?(self)

    @person = person
    person.rental.push(self) unless person.rental.include?(self)
  end
end
