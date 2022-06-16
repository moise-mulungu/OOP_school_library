require "./book.rb"
require "./person.rb"
require "./student.rb"
require "./teacher.rb"
require "./classroom.rb"
require "./people.rb"
require "./rental.rb"

class App
    def initialize
        @books = Books.new
        @people = People.new
        @rentals = Rentals.new(@books, @people)
    end

    def self.home_page
        puts 'Please, enter a number to select an option: '

        @content = {
            1 => 'List all books',
            2 => 'List all people',
            3 => 'Create a person (student or teacher)',
            4 => 'Create a book',
            5 => 'Create a rental',
            6 => 'List all rentals for a given person id',
            7 => 'Exit'
        }

        @content.each { |key, value| puts "#{key} - #{value}" }
        Integer(gets.chomp)
    end

    app = App.new

    loop do
        if home_page == 1
            app.@books.list_all_books
        elsif home_page == 2
            app.@people.list_all_people
        elsif home_page == 3
            app.@people.create_person
        elsif home_page == 4
            app.@books.create_book
        elsif home_page == 5
            app.@rentals.create_rental
        elsif home_page == 6
            app.@rentals.list_all_rentals
        elsif home_page == 7
            puts 'Goodbye!'
            Exit
        else
            puts 'Invalid option'
        end
    end

end