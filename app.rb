class App
    def initialize
        @books = Books.new
        @people = People.new
        @rentals = Rentals.new(@books, @people)
    end
end