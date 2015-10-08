#!/usr/bin/env ruby
require 'pry'
require_relative 'contact'
require_relative 'contact_database'

@db = ContactDatabase.new

ARGV << 'Help' if ARGV.empty?
  puts "Here is a list of available commands:"
  puts  "new  - Create a new contact"
  puts  "list - List all contacts"
  puts  "show - Show a contact"
  puts  "find - Find a contact"


case ARGV[0]
   when 'new'
    puts 'Enter contact email:'
    email = STDIN.gets.chomp
    puts 'Enter contact name:'
    name = STDIN.gets.chomp
    puts 'Enter contact phone number:'
    phone_numbers = STDIN.gets.chomp
    Contact.create(name, email, phone_numbers)

    when 'list'
      Contact.all

    when 'show'
      puts 'Enter an ID'
      id = STDIN.gets.chomp.to_i
      Contact.show(id)

    when 'find'
      puts 'Enter search term'
      term = STDIN.gets.chomp
      Contact.find(term)

    else
        puts 'Not recognized'
    end
