require 'pry'
require 'csv'

class ContactDatabase

  def initialize
    results = CSV.read("contacts.csv", :headers => true)
    results.each_with_index do |index, contact|
      next if index == 0
      Contact.new(contact[0], contact[1])
    end
  end

  def self.save_contact(array)
    CSV.open('contacts.csv', 'a') do |csv_object|
      csv_object << array
    end
  end

  def self.read
    display = CSV.read("contacts.csv", :headers => true)
    puts display
    end
end
