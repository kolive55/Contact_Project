require 'pry'
require_relative 'contact'
require_relative 'contact_database'

@db = ContactDatabase.new

ARGV << 'Help' if ARGV.empty?
  puts %q(
    Here is a list of available commands:
    new  - Create a new contact
    list - List all contacts
    show - Show a contact
    find - Find a contact
    )


puts "Please enter a command:"
  command = STDIN.gets.chomp
    if command == 'new'
        puts 'Enter contact email:'
        name = STDIN.gets.chomp
        puts 'Enter contact name:'
        email = STDIN.gets.chomp
        puts 'Enter contact phone number:'
        phone_numbers = STDIN.gets.chomp
        Contact.create(email, name, phone_numbers)

    elsif command == 'list'
        Contact.all

    elsif command == 'show'
      puts 'Enter an ID'
      id = STDIN.gets.chomp.to_i
      Contact.show(id)

    elsif command == 'find'
      puts 'Enter search term'
      term = STDIN.gets.chomp
      Contact.find(term)

    else
        puts 'Not recognized'
    end
