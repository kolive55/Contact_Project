require 'pry'
require 'csv'

class ContactDatabase

  def initialize
    results = CSV.read("contacts.csv")
    results.each_with_index do |index, contact|
      next if index == 0
      Contact.new(contact[0], contact[1], contact[2])
    end
  end

  def self.save_contact(array)
    CSV.open('contacts.csv', 'a') do |csv_object|
      csv_object << array
    end
  end

  def self.read
    display = CSV.read("contacts.csv")
    display.each_with_index do |index, contact|
      next if contact == 0
      puts "#{contact}"+"\."+"#{index[0]}" +","+ "#{index[1]}, #{index[2]}"
    end
  end

  def self.show(id)
    display = CSV.read("contacts.csv")
    display.each_with_index  do |contact, index|
       if id == index
         puts "#{contact[0]}, #{contact[1]}, #{contact[2]}"
       end
     end
   end

  def self.find(term)
    display = CSV.read("contacts.csv")
    v = Regexp.new(term)
    results = []
    display.each do |row|
      row = row.join(', ')
      if v.match(row)
        results << row
      end
    end
    puts results
  end

end
