require './person'
require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @books = []
    @rentals = []
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

#   CREATE METHODS FOR EACH ACTION
# list all books
  def list_books
    @books.each_with_index do |a, index|
      puts "#{index}) Title: \"#{a.title}\", Author: #{a.author} "
    end
  end

# list all people
  def list_people
    @people.each_with_index do |a, index|
      puts "#{index}) [#{a.class.name}] Name: #{a.name}, ID: #{a.id}, Age: #{a.age}"
    end
  end

#   All listed books
  def action_list_books
    list_books
    puts 'Press enter to continue ...'
    gets.chomp
    run
  end

#   All listed_people
  def action_list_people
    list_people
    puts "\n\nPress any key to continue"
    gets
    run
  end

#   Asking for permission
  def my_permission(my_char)
    if my_char == 'Y'
        true
    elsif my_char == 'N'
        false
    else
        puts 'Invalid choice. Please try again.'
        my_permission(gets.chomp)
    end
    # case my_char
    # when 'N'
    #   false
    # when 'Y'
    #   true
    # end
  end

#   create a teacher
  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, nil, specialization)
    @people.push(teacher)
  end

#   create a student
  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    student = Student.new(age, name, my_permission(permission), nil)
    @people.push(student)
  end

#   create a person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    if person_type == '1'
        create_student
    elsif person_type == '2'
        create_teacher
    else
        puts 'Invalid choice. Please try again.'
        create_person
    end

    # case person_type
    # when '1'
    #   create_student
    # when '2'
    #   create_teacher
    # end
    # puts "Person created successfully\n"
    # gets
    # run
  end

#   create a book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    run
  end

#   create a rental
  def create_rental
    puts "\nSelect a book from the following list by number"
    list_books
    book_index = gets.chomp
    puts "\nSelect a person from the following list by number"
    list_people
    person_index = gets.chomp
    print "\n Date(yyyy/mm/dd): "
    rental_date = gets.chomp
    new_rental = Rental.new(rental_date, @my_books[book_index.to_i], @people[person_index.to_i])
    @rentals.push(new_rental)
    puts 'Rental added successfully'
    run
  end

#   list all rentals for a given person id
  def list_rental
    me = nil
    print "\nID of person: "
    person_id = gets.chomp
    @people.each do |x|
      peoples = x if x.id == person_id.to_i
    end
    peoples.rentals.each do |x|
      puts x.date
    end
    puts
    run
end
end