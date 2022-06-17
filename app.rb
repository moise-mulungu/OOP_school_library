require './person'
require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @my_books = []
    @my_rentals = []
    @people = []
  end

  def show_menu
    puts "Welcome to School Library App!\n\n"
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n\n"
    gets.chomp
  end

  def run(choice)
    show_menu = ''
    if choice == '1'
      show_menu = list_books
    elsif choice == '2'
        show_menu = list_people
    elsif choice == '3'
        show_menu = create_person
    elsif choice == '4'
        show_menu = create_book
    elsif choice == '5'
        show_menu = create_rental
    elsif choice == '6'
        show_menu = list_rentals
    elsif choice == '7'
        show_menu = exit_app
    else
        puts 'Invalid choice. Please try again.'
        show_menu = show_menu
    end
    
  end