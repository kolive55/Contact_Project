require 'pry'
require_relative 'contact'
require 'pg'
require 'active_record'


class Application
  def run
    puts 'Establishing connection to database ...'
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      database: 'contacts',
      username: 'kyria',
      password: 'development',
      host: 'localhost'
    )
    puts 'CONNECTED'

    puts "Enter a command:"
    command = gets.chomp

    case command
       when 'new'
        puts 'Enter first name:'
        first_name = STDIN.gets.chomp
        puts 'Enter last name:'
        last_name = STDIN.gets.chomp
        puts 'Enter email address:'
        email = STDIN.gets.chomp
        Contact.create(first_name: first_name, last_name: last_name, email: email)

        when 'list'
          list = Contact.all
          list.each do |person|
            puts person.first_name + " " + person.last_name
            puts person.email
          end


        when 'show'
          puts 'Enter an ID'
          id = STDIN.gets.chomp.to_i
          result = Contact.find(id)
          puts "#{result.first_name} #{result.last_name} #{result.email}"

        when 'first'
          puts 'Enter first_name'
          term = STDIN.gets.chomp
          result = Contact.find_by(first_name: term)
          puts "#{result.first_name} #{result.last_name} #{result.email}"

        when 'last'
          puts 'Enter last_name'
          term = STDIN.gets.chomp
          result = Contact.find_by(last_name: term)
          puts "#{result.first_name} #{result.last_name} #{result.email}"

        when 'email'
          puts 'Enter email'
          term = STDIN.gets.chomp
          result = Contact.where(email: term)
          puts "#{result.first_name} #{result.last_name} #{result.email}"

        when 'axe'
          puts 'Enter ID'
          id = gets.chomp
          Contact.destroy(id)

        else
            puts 'Not recognized'
      end
    end
end

Application.new.run
