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
        puts 'Enter contact name:'
        name = STDIN.gets.chomp
        puts 'Enter contact email:'
        email = STDIN.gets.chomp
        Contact.create(name, email)

    elsif command == 'list'
        Contact.all

    elsif command == 'show'
      puts 'Enter an ID'
      id = STDIN.gets.chomp
      Contact.show(id.to_i)

    else
        puts 'Not recognized'
    end
