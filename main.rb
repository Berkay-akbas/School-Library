require_relative 'app'

def main
  app = App.new
  loop do
    message
    option = gets.chomp
    break if option == '7'

    app_list(option, app)
  end
end

def message
  puts "\n"
  puts "Welcome to school library. What do you want to do?\n"
  puts "
  1 - List All Books
  2 - List All People
  3 - Create a Person
  4 - Create a Book
  5 - Create a Rental
  6 - List All Rentals
  7 - Exit"
end

def app_list(option, app)
  case option
  when '1'
    app.list_books
  when '2'
    app.list_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals
  end
end

main
