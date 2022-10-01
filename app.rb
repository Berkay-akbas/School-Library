require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'rental'
require_relative 'person'

class App
  def initialize
    @people = []
    @books = []
  end

  def list_books
    puts "\n"
    @books.each_with_index do |book, index|
      puts "[#{index + 1}] Title: `#{book.title}`, Author: #{book.author}"
    end
  end

  def list_people
    puts "\n"
    @people.each_with_index do |person, index|
      if person.instance_of?(Student)
        print "[#{index + 1}][Student] Id: #{person.id}, Name: #{person.name}, Age: #{person.age},"
        print "Parent Permission: #{person.parent_permission}, Classroom: #{person.classroom}"
      else
        print "[#{index + 1}][Teacher] Id: #{person.id}, Name: #{person.name}, "
        print "Age: #{person.age}, Specialization: #{person.specialization}"
      end
      puts "\n"
    end
  end

  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    if age < 18
      print 'Parent Permission: '
      parent_permission = gets.chomp
      parent_permission = true if parent_permission == 'y'
      parent_permission = false if parent_permission == 'n'
    else
      parent_permission = true
    end
    print 'Classroom: '
    classroom = gets.chomp
    student = Student.new(classroom, age, parent_permission: parent_permission, name: name)
    @people << student unless @people.include?(student)
    puts 'Student created successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully!'
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name: name)
    @people.push(teacher)
    puts 'Teacher created successfully!'
  end

  private :create_student, :create_teacher

  def create_person
    puts 'Choose an option by entering a number:'
    puts '1 - Create a student'
    puts '2 - Create a teacher'
    puts '3 - Exit'
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    when '3'
      puts 'Exiting'
    else
      puts "\n"
      puts 'Invalid option'
      puts "\n"
      create_person
    end
  end

  def create_rental
    puts "\n"
    puts "Select the book by it's number:\n"
    list_books
    book_index = gets.chomp.to_i
    puts "Select the person by it's number:\n"
    list_people
    person_index = gets.chomp.to_i
    puts "Date: format YYYY/MM/DD\n"
    date = gets.chomp
    Rental.new(date, @books[book_index - 1], @people[person_index - 1])
    puts 'Rental created successfully!'
  end

  def list_rentals
    puts "Select the person:\n"
    list_people
    index = gets.chomp.to_i
    @people[index - 1].rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
