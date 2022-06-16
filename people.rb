require_relative './person'

class Peoplemodule
  attr_accessor :people

  def initialize
    @people = []
  end

  def list_people
    if @people.empty?
      puts 'No people added'
    else
      @people.each_with_index do |person, index|
        puts "#{index + 1}) [#{person.class.name}] Name: #{person.name}|Age: #{person.age} |ID: #{person.id}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher (2)?[Input a number]:'
    option = gets.chomp

    if option == '1'
        create_student
    elsif option == '2'
        create_teacher
    else
        puts 'Invalid option'
    end
    puts 'Person created'
  end

  def student_creation(age, name, parent_permission)
    case parent_permission
    when 'y'
      student = Student.new(age, name, parent_permission: true)
    when 'n'
      student = Student.new(age, name, parent_permission: false)
    else
      puts 'Invalid input'
    end
    @people.push(student)
  end

  def create_student
    puts 'Create a student'
    print 'Enter student name:'
    name = gets.chomp
    print 'Enter student age:'
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp.downcase
    student_creation(age, name, parent_permission)
  end

  def create_teacher
    puts 'Create a teacher'
    print 'Enter teacher name:'
    name = gets.chomp
    print 'Enter teacher age:'
    age = gets.chomp.to_i
    print 'Enter teacher specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
  end
end