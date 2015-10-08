require_relative 'contact_database'
class Contact

  attr_accessor :name, :email, :phone_numbers

  def initialize(name, email, phone_numbers)
    @name = name
    @email = email
    @phone_numbers = phone_numbers
  end

  def to_s
    "Name: #{@name}, Email: #{@email}"
  end

  ## Class Methods
  class << self
    def create(name, email, phone_numbers)
       Contact.new(name, email, phone_numbers)
       ContactDatabase.save_contact([name, email, phone_numbers])
       # TODO: Will initialize a contact as well as add it to the list of contacts
    end

    def find(term)
      ContactDatabase.find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end

    def all
      ContactDatabase.read
      # TODO: Return the list of contacts, as is
    end

    def show(id)
      ContactDatabase.show(id)
      # TODO: Show a contact, based on ID
    end

  end

end
